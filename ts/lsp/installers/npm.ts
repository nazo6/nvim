import { executeShell } from './term';

export const npm = (packageName: string, installPath: string, onExit: (exitCode: number) => void) => {
  vim.fn.mkdir(installPath, 'p');
  executeShell(`npm install ${packageName}`, installPath, onExit);
};
