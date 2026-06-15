import { callAlbert } from '../tools/albertTool.js';
import { webFetchTool } from '../tools/webFetchTool.js';

const INSTRUCTIONS = `Tu es un expert en traitement du langage naturel (NLP) et en extraction de données. Ton objectif est d'analyser le contenu d'une page web et d'en extraire des métadonnées précises.

Voici les éléments que tu dois extraire :
- lieux : Les zones géographiques, villes, pays ou adresses mentionnés. Pour chaque lieu, précise son contexte ou son importance dans le texte.
- personnes : Les individus, personnalités ou auteurs nommés. Pour chaque personne, précise son rôle, sa fonction ou son action associée dans le texte.
- dates : Les dates, années ou périodes temporelles spécifiques. Pour chaque date, indique l'événement précis ou le contexte qui y est rattaché.
- mainTopic : Le sujet principal abordé (en une courte phrase).
- keyConcepts : Les concepts clés, idées fortes ou terminologies spécifiques au domaine.
- summary : Un résumé concis et complet du contenu (3 à 5 phrases maximum).
- themes : Les thématiques générales abordées (ex: Technologie, Politique, Santé).
- targetAudience : Le public cible à qui s'adresse ce texte (ex: Grand public, Professionnels de la santé, Développeurs).
- tone : Le ton général du texte (ex: Informatif, Persuasif, Satirique, Neutre).
- language : La langue principale dans laquelle le texte est rédigé (code ISO, ex: "fr", "en", "es").

RÈGLES IMPORTANTES :
1. Renvoie UNIQUEMENT un objet JSON valide. 
2. Si une information n'est pas présente ou ne peut pas être déduite, utilise une liste vide [] pour les tableaux, ou la valeur null pour les chaînes de caractères.
3. Les champs "keyConcepts" et "themes" doivent être des tableaux (arrays) de chaînes de caractères.
4. Les champs "lieux", "personnes" et "dates" doivent être des tableaux d'objets contenant les précisions demandées, comme défini dans le format de sortie.

Format de sortie attendu :
{
  "lieux": [
    {
      "nom": "Nom du lieu",
      "contexte": "Précision sur ce qu'il s'y passe ou pourquoi il est mentionné"
    }
  ],
  "personnes": [
    {
      "nom": "Nom de la personne",
      "role": "Fonction, titre ou précision sur la personne"
    }
  ],
  "dates": [
    {
      "valeur": "La date ou période",
      "evenement": "Ce qui s'est passé ou se passera à cette date"
    }
  ],
  "mainTopic": "",
  "keyConcepts": [],
  "summary": "",
  "themes": [],
  "targetAudience": "",
  "tone": "",
  "language": ""
}`;

export const contextAgent = {
  name: 'contextAgent',
  async generate(url) {
    const { content, title } = await webFetchTool.execute({ url });
    const userMessage = `Analyze the semantic context of this web page titled "${title}":\n\n${content}`;
    const raw = await callAlbert(INSTRUCTIONS, userMessage);
    const result = JSON.parse(cleanJson(raw));
    return {
      result,
      source: { url, title, contentSnippet: content.slice(0, 1500) },
      prompt: { system: INSTRUCTIONS, user: userMessage },
    };
  },
};

function cleanJson(text) {
  return text.replace(/^```json\s*/i, '').replace(/^```\s*/i, '').replace(/```\s*$/i, '').trim();
}
