import { ServerConfigType } from '../constants';
import { executeShell } from '../installers/term';
import { getServerDir } from '../utils';

const win = vim.fn.has('win32') !== 0;
const unix = vim.fn.has('unix') !== 0;
const downloadFileName = win
  ? 'rust-analyzer-x86_64-pc-windows-msvc'
  : unix
  ? 'rust-analyzer-x86_64-unknown-linux-gnu'
  : null;

const name = 'rust_analyzer';
const cwd = getServerDir(name);

export const config: ServerConfigType = {
  name,
  installer: (onExit) => {
    if (!downloadFileName) {
      print('Not supported OS.');
      onExit(1);
      return;
    }
    vim.fn.mkdir(cwd, 'p');
    vim.fn.delete(cwd + '/rust-analyzer', 'rf');
    executeShell(
      `
      mkdir rust-analyzer &&
      cd rust-analyzer &&
      curl -L -o ${downloadFileName}.gz https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/${downloadFileName}.gz &&
      ${win ? 'mv ' + downloadFileName + '.gz ' + downloadFileName + '.exe &&' : ''}
      gunzip ${downloadFileName}.gz
      ${unix ? 'chmod +x ' + downloadFileName : ''}
      `,
      cwd,
      (exitCode) => {
        vim.fn.delete(cwd + 'rust-analyzer.gz');
        onExit(exitCode);
      },
      { wsl: true }
    );
  },
  defaultOptions: {
    cmd: [cwd + `/rust-analyzer/${downloadFileName}${win ? '.exe' : ''}`]
  }
};
