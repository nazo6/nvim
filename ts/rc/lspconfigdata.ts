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
  },
  typescript: {
    root_dir: root_pattern('package.json', 'tsconfig.json'),
    on_attach: noFormatting
  },
  tailwindcss: {
    root_dir: root_pattern('tailwind.config.js', 'tailwind.config.ts')
  },
  diagnosticls: {
    filetypes: ['javascript', 'javascriptreact', 'json', 'jsonc', 'typescript', 'typescript.tsx', 'typescriptreact'],
    root_dir: root_pattern('.git', 'package.json', 'tsconfig.json'),
    init_options: {
      filetypes: {
        javascript: 'eslint',
        javascriptreact: 'eslint',
        typescript: 'eslint',
        typescriptreact: 'eslint',
        'typescript.tsx': 'eslint'
      },
      formatFiletypes: {
        javascript: 'prettier',
        javascriptreact: 'prettier',
        json: 'prettier',
        jsonc: 'prettier',
        typescript: 'prettier',
        typescriptreact: 'prettier',
        'typescript.tsx': 'prettier'
      },
      linters: {
        eslint: {
          command: 'eslint_d',
          rootPatterns: ['.eslintrc', '.eslintrc.js', '.eslintrc.yml'],
          debounce: 100,
          args: ['--stdin', '--stdin-filename', '%filepath', '--format', 'json'],
          sourceName: 'eslint',
          parseJson: {
            errorsRoot: '[0].messages',
            line: 'line',
            column: 'column',
            endLine: 'endLine',
            endColumn: 'endColumn',
            message: '[eslint] ${message} [${ruleId}]',
            security: 'severity'
          },
          securities: ['info', 'warning', 'error']
        }
      },
      formatters: {
        prettier: {
          command: 'prettier',
          args: ['--fix'],
          rootPatterns: ['.prettierrc', '.prettierrc.js', 'prettierrc.yml']
        }
      }
    }
  }
};
