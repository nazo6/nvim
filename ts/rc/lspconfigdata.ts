import { schemas } from '../data/catalog.json';

const root_pattern = (require('lspconfig').util as any as NoColonType).root_pattern;

const noFormatting = (client: any) => {
  client.resolved_capabilities.document_formatting = false;
};

export const serverCfgs = {
  deno: {
    root_dir: root_pattern('.nvim-lsp-denols')
  },
  css: {
    on_attach: noFormatting
  },
  html: {
    on_attach: noFormatting
  },
  json: {
    filetypes: ['json', 'jsonc'],
    settings: {
      json: { schemas }
    }
  }
};
