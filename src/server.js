import 'dotenv/config';
import { serve } from '@hono/node-server';
import { serveStatic } from '@hono/node-server/serve-static';
import { Hono } from 'hono';
import { contextAgent } from './agents/contextAgent.js';
import { authorAgent } from './agents/authorAgent.js';
import { scanrPersonAgent } from './agents/scanrPersonAgent.js';
import { writerAgent } from './agents/writerAgent.js';
import { quartoAgent } from './agents/quartoAgent.js';
import { zoteroEnrichAgent } from './agents/zoteroEnrichAgent.js';
import { scholarTool, getRefScholar } from './tools/scholarTool.js';
import { scanrPersonTool } from './tools/scanrPersonTool.js';
import { webFetchTool } from './tools/webFetchTool.js';
import { zoteroTool } from './tools/zoteroTool.js';
import { omkAgent } from './agents/omkAgent.js';
import { omkTool } from './tools/omkTool.js';

const app = new Hono();

await omkAgent.init();
//récupération des références pour les outils
const   async getRef(omk) {

    let ia = getRefAlert(),
      title = this.name+' ['+ia.name+']'+' ['+ia.model+']',
      dtOmk = {'rt':'agent','c':'dcterms:Agent',
          'dt':{"dcterms:type":ia.model,
              "dcterms:description":this.instructions,
              "dcterms:title":title,
              "jdc:hasCrible":{"model":ia.model,"max_tokens":4096,"temperature":0.3},
          },
          'verif':{"dcterms:title":title},
          'index':title
        };
    return omk.getCreateItem(dtOmk);
  }
app.use('/public/*', serveStatic({ root: './' }));
app.get('/', serveStatic({ path: './public/index.html' }));

// ── Recherche des auteurs (Semantic Scholar + scanR) ──────────────────────────
app.post('/api/search', async (c) => {

  let body;
  try { body = await c.req.json(); } catch { return c.json({ error: 'Invalid JSON body' }, 400); }

  const { url, authorName } = body;
  if (!url || !authorName) return c.json({ error: 'Les champs url et authorName sont requis' }, 400);

  //récupère les données de la page Web
  let rs = await omkAgent.searchResources({"bibo:uri":url}),
    webDataRef;
  if(rs.length==0){
    let webData = await webFetchTool.execute({ url }),
      dtOmk = {
        'o:resource_class':'bibo:Webpage',
        'o:resource_template':'Web document',
        "bibo:uri":url,
        "dcterms:title":webData.title,
        "curation:data":webData.content
        };
    webDataRef = await omkAgent.createItem(dtOmk); 
  }else webDataRef = rs[0];  
 
  //récupère les données de google scholar

  const [scholarData, scanrData] = await Promise.allSettled([
    scholarTool.execute({ author: authorName, maxResults: 5 }),
    scanrPersonTool.execute({ name: authorName, limit: 5 }),
  ]);

  return c.json({
    web: webData.status === 'fulfilled'
      ? { url, title: webData.value.title }
      : { url, title: url, error: webData.reason?.message },
    semanticScholar: scholarData.status === 'fulfilled'
      ? (scholarData.value.authorId
          ? [{ id: scholarData.value.authorId, name: scholarData.value.authorName,
               paperCount: scholarData.value.paperCount, citationCount: scholarData.value.citationCount,
               publications: scholarData.value.publications }]
          : [])
      : [],
    scanr: scanrData.status === 'fulfilled' ? scanrData.value.persons : [],
    errors: {
      semanticScholar: scholarData.status === 'rejected' ? scholarData.reason?.message : null,
      scanr: scanrData.status === 'rejected' ? scanrData.reason?.message : null,
    },
  });
});

// ── Enrichissement Zotero (standalone) ───────────────────────────────────────
app.post('/api/zotero-enrich', async (c) => {
  let body;
  try { body = await c.req.json(); } catch { return c.json({ error: 'Invalid JSON body' }, 400); }

  const { authorName, authorProfile, searchMode, maxItems } = body;
  if (!authorName) return c.json({ error: 'Le champ authorName est requis' }, 400);

  const data = await zoteroEnrichAgent.generate(
    authorProfile ?? {},
    authorName,
    { searchMode: searchMode ?? 'both', maxItems: maxItems ?? 50 }
  );

  return c.json(data);
});

// ── Génération d'expertise ────────────────────────────────────────────────────
app.post('/api/generate', async (c) => {
  let body;
  try {
    body = await c.req.json();
  } catch {
    return c.json({ error: 'Invalid JSON body' }, 400);
  }

  const { url, authorName, authorSource, enrichWithZotero } = body;
  if (!url || !authorName) {
    return c.json({ error: 'Les champs url et authorName sont requis' }, 400);
  }

  // Étape 1 : contextAgent + authorAgent en parallèle (agent choisi selon la source)
  const pickAuthorAgent = authorSource === 'scanr' ? scanrPersonAgent : authorAgent;
  //récupère les références de l'agent
  const refAuthorAgent = await pickAuthorAgent.getRef(omkAgent);

  const [contextData, authorData] = await Promise.all([
    contextAgent.generate(url),
    pickAuthorAgent.generate(authorName),
  ]);
  let toto = omkAgent.getRtByLabel('toto');
  // Étape 1b (optionnel) : enrichissement Zotero du profil auteur
  let zoteroData = null;
  let finalAuthorProfile = authorData.result;
  if (enrichWithZotero) {
    zoteroData = await zoteroEnrichAgent.generate(authorData.result, authorName);
    finalAuthorProfile = zoteroData.result ?? authorData.result;
  }

  // Étape 2 : writerAgent génère le texte avec le profil final (éventuellement enrichi)
  const writerData = await writerAgent.generate(contextData.result, finalAuthorProfile);

  const quartoData = await quartoAgent.generate({
    title: writerData.result.title,
    text: writerData.result.text,
    authorVoiceNotes: writerData.result.authorVoiceNotes,
    semanticContext: contextData.result,
    authorProfile: authorData.result,
    scholarData: authorData.source,
    webSource: contextData.source,
  });

  return c.json({
    ...writerData.result,
    quarto: quartoData,
    trace: {
      contextAgent: {
        source: contextData.source,
        prompt: contextData.prompt,
        result: contextData.result,
      },
      authorAgent: {
        source: authorData.source,
        prompt: authorData.prompt,
        result: authorData.result,
      },
      ...(zoteroData ? {
        zoteroEnrichAgent: {
          source: zoteroData.source,
          prompt: zoteroData.prompt,
          result: zoteroData.result,
          warning: zoteroData.warning ?? null,
        },
      } : {}),
      writerAgent: {
        prompt: writerData.prompt,
      },
    },
  });
});

const port = Number(process.env.PORT ?? 3000);
console.log(`Serveur démarré → http://localhost:${port}`);
serve({ fetch: app.fetch, port });
