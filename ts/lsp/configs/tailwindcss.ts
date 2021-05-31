import { ServerConfigType } from '../constants';
import { executeShell } from '../installers/term';
import { getServerDir } from '../utils';

const util = require('lspconfig').util as any as NoColonType;

const win = vim.fn.has('win32') !== 0;

const name = 'tailwindcss';
const cwd = getServerDir(name);
vim.fn.mkdir(cwd, 'p');
const serverPath = cwd + '/tailwindcss-intellisense/extension/dist/server/tailwindServer.js';

export const config: ServerConfigType = {
  name,
  installer: (onExit) => {
    const repoInfo: string = vim.fn.system(
      'curl -s https://api.github.com/repos/tailwindlabs/tailwindcss-intellisense/releases/latest'
    );
    const downloadUrl: any = vim.fn.json_decode(repoInfo)['assets'][1]['browser_download_url'];
    vim.fn.delete(cwd + '/tailwindcss-intellisense', 'rf');
    executeShell(
      `
      curl -L -o tailwindcss-intellisense.zip ${downloadUrl} &&
      mkdir ./tailwindcss-intellisense &&
      ${win ? 'tar' : 'bsdtar'} -C ./tailwindcss-intellisense -xvf tailwindcss-intellisense.zip
      `,
      cwd,
      (exitCode) => {
        vim.fn.delete(cwd + 'tailwindcss-intellisense.zip');
        onExit(exitCode);
      }
    );
  },
  defaultOptions: {
    autostart: true,
    cmd: ['node', serverPath, '--stdio'],
    filetypes: [
      // html
      'aspnetcorerazor',
      'blade',
      'django-html',
      'edge',
      'ejs',
      'erb',
      'gohtml',
      'GoHTML',
      'haml',
      'handlebars',
      'hbs',
      'html',
      'HTML (Eex)',
      'HTML (EEx)',
      'html-eex',
      'jade',
      'leaf',
      'liquid',
      'markdown',
      'mdx',
      'mustache',
      'njk',
      'nunjucks',
      'php',
      'razor',
      'slim',
      'twig',
      // css
      'css',
      'less',
      'postcss',
      'sass',
      'scss',
      'stylus',
      'sugarss',
      // js
      'javascript',
      'javascriptreact',
      'reason',
      'rescript',
      'typescript',
      'typescriptreact',
      // mixed
      'vue',
      'svelte'
    ],
    init_options: {
      userLanguages: {
        eelixir: 'html-eex',
        eruby: 'erb'
      }
    },
    root_dir: (fname: string) => {
      return null;
    }
  }
};
