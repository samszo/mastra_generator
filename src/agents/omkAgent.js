/**
 * Agent Omeka S — initialise la connexion et expose les opérations CRUD
 * sur les ressources Omeka S (items, media, item_sets).
 */

const perPage = 1000;

function buildAuthParams(agent) {
  return `key_identity=${agent.ident}&key_credential=${agent.key}`;
}

async function apiFetch(url, options = {}) {
  const response = await fetch(url, {
    cache: 'no-cache',
    ...options,
  });
  if (!response.ok) {
    const text = await response.text();
    throw new Error(`Omeka S API error ${response.status}: ${text}`);
  }
  // DELETE returns 204 No Content
  if (response.status === 204) return null;
  return response.json();
}

async function apiGet(url) {
  return apiFetch(url);
}

async function apiPost(url, data, file = null) {
  let body, headers = {};
  if (file) {
    body = new FormData();
    body.append('data', JSON.stringify(data));
    body.append('file[1]', file);
  } else {
    body = JSON.stringify(data);
    headers['Content-Type'] = 'application/json';
  }
  return apiFetch(url, { method: 'POST', headers, body });
}

async function apiPut(url, data) {
  return apiFetch(url, {
    method: 'PUT',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data),
  });
}

async function apiDelete(url) {
  return apiFetch(url, { method: 'DELETE' });
}

export const omkAgent = {
  name: 'omkAgent',

  // — état interne
  apiUrl: null,
  ident: null,
  key: null,
  vocabs: [],
  rts: [],
  props: [],
  classes: [],
  ready: false,
  items: [],

  async init() {
    this.apiUrl  = (process.env.OMEKA_URL ?? 'http://localhost/omeka_s') + '/api/';
    this.ident   = process.env.OMEKA_KEY_IDENTITY ?? '';
    this.key     = process.env.OMEKA_KEY_CREDENTIAL ?? '';
    this.vocabs  = process.env.OMK_VOCABS
      ? JSON.parse(process.env.OMK_VOCABS.replace(/'/g, '"'))
      : ['dcterms', 'foaf'];

    this.rts     = [];
    this.props   = [];
    this.classes = [];

    try {
      await this._loadResourceTemplates();
      for (const prefix of this.vocabs) {
        await this._loadProperties(prefix);
        await this._loadClasses(prefix);
      }
      this.ready = true;
      console.log('[omkAgent] Initialisation terminée');
    } catch (err) {
      console.warn('[omkAgent] Initialisation partielle :', err.message);
    }
    return this;
  },

  // ── Chargement des métadonnées ──────────────────────────────────────────────

  async _loadResourceTemplates() {
    const data = await apiGet(`${this.apiUrl}resource_templates?per_page=${perPage}`);
    this.rts = Array.isArray(data) ? data : [];
  },

  async _loadProperties(prefix) {
    const data = await apiGet(
      `${this.apiUrl}properties?per_page=${perPage}&vocabulary_prefix=${prefix}`
    );
    if (Array.isArray(data)) this.props = this.props.concat(data);
  },

  async _loadClasses(prefix) {
    const data = await apiGet(
      `${this.apiUrl}resource_classes?per_page=${perPage}&vocabulary_prefix=${prefix}`
    );
    if (Array.isArray(data)) this.classes = this.classes.concat(data);
  },

  // ── Helpers de lookup ───────────────────────────────────────────────────────

  getRtByLabel(label) {
    return this.rts.find(rt => rt['o:label'] === label) ?? null;
  },

  getPropByTerm(term) {
    return this.props.find(p => p['o:term'] === term) ?? null;
  },

  getClassByTerm(term) {
    return this.classes.find(c => c['o:term'].toLowerCase() === term.toLowerCase()) ?? null;
  },

  getClassByLabel(label) {
    return this.classes.find(c => c['o:label'].toLowerCase() === label.toLowerCase()) ?? null;
  },

  // ── Formatage des données pour l'API ────────────────────────────────────────

  /**
   * Convertit un objet simplifié en payload Omeka S.
   * Clés spéciales : o:resource_template (label), o:resource_class (term),
   *                  o:item_set (id), o:media (url), file (File object).
   * Toute autre clé est traitée comme un terme de propriété RDF (ex: "dcterms:title").
   */
  formatData(data, type = 'o:Item') {
    const fd = { '@type': type };

    for (const [k, v] of Object.entries(data)) {
      switch (k) {
        case 'o:resource_template': {
          const rt = this.getRtByLabel(v);
          if (rt) fd[k] = { 'o:id': rt['o:id'] };
          break;
        }
        case 'o:resource_class': {
          const cls = this.getClassByTerm(v) ?? this.getClassByLabel(v);
          if (cls) fd[k] = { 'o:id': cls['o:id'] };
          break;
        }
        case 'o:item_set':
          fd[k] = Array.isArray(v) ? v.map(id => ({ 'o:id': id })) : [{ 'o:id': v }];
          break;
        case 'o:media':
          if (!fd[k]) fd[k] = [];
          if (Array.isArray(v)) {
            v.forEach(url => fd[k].push({ 'o:ingester': 'url', ingest_url: url }));
          } else {
            fd[k].push({ 'o:ingester': 'url', ingest_url: v });
          }
          break;
        case 'file':
          fd['o:media'] = [{ 'o:ingester': 'upload', file_index: '1' }];
          break;
        default: {
          const prop = this.getPropByTerm(k);
          if (!prop) break;
          if (!fd[k]) fd[k] = [];
          const values = Array.isArray(v) ? v : [v];
          fd[k] = values.map(val => this._formatValue(prop, val));
        }
      }
    }
    return fd;
  },

  _formatValue(prop, v) {
    const pid = prop['o:id'];
    if (typeof v === 'object' && v !== null) {
      if (v.rid)
        return { property_id: pid, value_resource_id: v.rid, type: 'resource' };
      if (v.u)
        return { property_id: pid, '@id': v.u, 'o:label': v.l ?? '', type: 'uri' };
      return { property_id: pid, '@value': JSON.stringify(v), type: 'literal' };
    }
    return { property_id: pid, '@value': String(v), type: 'literal' };
  },

  // ── READ ────────────────────────────────────────────────────────────────────

  async getResource(type, id) {
    return apiGet(`${this.apiUrl}${type}/${id}`);
  },

  async getItem(id) {
    return this.getResource('items', id);
  },

  async getMedia(id) {
    return this.getResource('media', id);
  },

  async getItemSet(id) {
    return this.getResource('item_sets', id);
  },

  /**
   * Recherche paginée. Renvoie tous les résultats si maxItems === 0.
   * @param {string} query - paramètres de recherche (ex: "resource_class_id=5&q=foo")
   * @param {string} type  - 'items' | 'media' | 'item_sets'
   * @param {number} maxItems - 0 = tout, sinon limite
   */
  async searchResources(query = '', type = 'items', maxItems = 50) {
    const results = [];
    let page = 1;
    while (true) {
      const url = `${this.apiUrl}${type}?per_page=${perPage}&page=${page}${query ? '&' + query : ''}`;
      const data = await apiGet(url);
      if (!Array.isArray(data) || data.length === 0) break;
      results.push(...data);
      if (maxItems > 0 && results.length >= maxItems) break;
      if (data.length < perPage) break;
      page++;
    }
    return maxItems > 0 ? results.slice(0, maxItems) : results;
  },

  // ── CREATE ──────────────────────────────────────────────────────────────────

  async createResource(type = 'items', data, file = null) {
    const url = `${this.apiUrl}${type}?${buildAuthParams(this)}`;
    const payload = this.formatData(data, type === 'items' ? 'o:Item' : type === 'media' ? 'o:Media' : 'o:ItemSet');
    return apiPost(url, payload, file);
  },

  /**
   * Recherche une ressource et la crée si elle n'exsite pas
   * @param {object} r - paramètres de recherche et de création
   */
  async getCreateItem(r) {
      if(this.items[r.index])return this.items[r.index];
      //vérifie l'existence de la ressource
      let query = "resource_class_id[]="+this.getClassByTerm(r.c)['o:id'], i=0;
      if(!r.verif)r.verif=r.dt;
      for (const k in r.verif) {
          query += "&property["+i+"][joiner]=and&property["+i+"][property]="
          +this.getPropByTerm(k).id
          +"&property["+i+"][type]=eq&property["+i+"][text]="+r.verif[k];
      }
      let items = this.searchResources(query);
      if(items.length){
          this.items[r.index]=items[0];
          return items[0];
      } 
      r.dt['o:resource_class']=r.c;
      r.dt['o:resource_template']=r.rt;
      return await this.createItem(r.dt,r.index);
  },

  async createItem(data, index, file = null) {
    this.items[index] = await this.createResource('items', data, file);
    return this.items[index];
  },

  async createItemSet(data) {
    return this.createResource('item_sets', data);
  },

  // ── UPDATE ──────────────────────────────────────────────────────────────────

  /**
   * Met à jour une ressource existante.
   * @param {string}  type     - 'items' | 'media' | 'item_sets'
   * @param {number}  id       - identifiant Omeka S
   * @param {object}  data     - champs à modifier (format simplifié)
   * @param {boolean} merge    - si true, fusionne avec les données existantes (défaut: false = remplacement)
   */
  async updateResource(type = 'items', id, data, merge = false) {
    const url = `${this.apiUrl}${type}/${id}?${buildAuthParams(this)}`;
    const otype = type === 'items' ? 'o:Item' : type === 'media' ? 'o:Media' : 'o:ItemSet';
    const newData = this.formatData(data, otype);

    if (merge) {
      const oriData = await this.getResource(type, id);
      for (const [k, v] of Object.entries(newData)) {
        if (k === '@type') continue;
        if (Array.isArray(oriData[k]) && Array.isArray(v) && k !== 'o:resource_template' && k !== 'o:resource_class') {
          oriData[k] = oriData[k].concat(v);
        } else {
          oriData[k] = v;
        }
      }
      return apiPut(url, oriData);
    }

    return apiPut(url, newData);
  },

  async updateItem(id, data, merge = false) {
    return this.updateResource('items', id, data, merge);
  },

  // ── DELETE ──────────────────────────────────────────────────────────────────

  async deleteResource(type = 'items', id) {
    const url = `${this.apiUrl}${type}/${id}?${buildAuthParams(this)}`;
    return apiDelete(url);
  },

  async deleteItem(id) {
    return this.deleteResource('items', id);
  },

  async deleteMedia(id) {
    return this.deleteResource('media', id);
  },

  // ── Utilitaires ─────────────────────────────────────────────────────────────

  async getUser() {
    const url = `${this.apiUrl}users?email=${encodeURIComponent(process.env.OMEKA_USER_EMAIL ?? '')}&${buildAuthParams(this)}`;
    const data = await apiGet(url);
    return Array.isArray(data) && data.length ? data[0] : null;
  },
};
