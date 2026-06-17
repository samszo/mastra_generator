import { createTool } from '@mastra/core/tools';
import { z } from 'zod';
import { omkAgent } from '../agents/omkAgent.js';

export const omkTool = createTool({
  id: 'bdd_omk',
  description: 'Gestionnaire CRUD des ressources dans une base de données Omeka S',
  inputSchema: z.object({
    queryMode: z.enum(['create', 'read', 'update', 'delete']).default('read')
      .describe('Action à effectuer dans Omeka S'),
    resourceType: z.enum(['items', 'media', 'item_sets']).default('items')
      .describe('Type de ressource Omeka S'),
    id: z.number().int().positive().optional()
      .describe('Identifiant de la ressource (requis pour read/update/delete)'),
    query: z.string().optional()
      .describe('Paramètres de recherche pour le mode read (ex: "q=foo&resource_class_id=5")'),
    data: z.record(z.unknown()).optional()
      .describe('Données de la ressource pour create/update'),
    merge: z.boolean().default(false)
      .describe('Pour update : fusionner avec les données existantes (true) ou remplacer (false)'),
    maxItems: z.number().int().min(0).max(1000).default(50)
      .describe('Nombre maximum de résultats pour read (0 = tout)'),
  }),
  outputSchema: z.object({
    success: z.boolean(),
    itemCount: z.number(),
    items: z.array(z.record(z.unknown())),
    error: z.string().optional(),
  }),
  execute: async ({ queryMode, resourceType, id, query, data, merge, maxItems }) => {
    try {
      if (!omkAgent.ready) await omkAgent.init();

      switch (queryMode) {
        case 'create': {
          if (!data) throw new Error('Le champ "data" est requis pour create');
          const created = await omkAgent.createResource(resourceType, data);
          return { success: true, itemCount: 1, items: [created] };
        }

        case 'read': {
          if (id !== undefined) {
            const item = await omkAgent.getResource(resourceType, id);
            return { success: true, itemCount: 1, items: [item] };
          }
          const items = await omkAgent.searchResources(resourceType, query ?? '', maxItems);
          return { success: true, itemCount: items.length, items };
        }

        case 'update': {
          if (id === undefined) throw new Error('Le champ "id" est requis pour update');
          if (!data) throw new Error('Le champ "data" est requis pour update');
          const updated = await omkAgent.updateResource(resourceType, id, data, merge);
          return { success: true, itemCount: 1, items: [updated] };
        }

        case 'delete': {
          if (id === undefined) throw new Error('Le champ "id" est requis pour delete');
          await omkAgent.deleteResource(resourceType, id);
          return { success: true, itemCount: 0, items: [] };
        }

        default:
          throw new Error(`Mode inconnu : ${queryMode}`);
      }
    } catch (err) {
      return { success: false, itemCount: 0, items: [], error: err.message };
    }
  },
});
