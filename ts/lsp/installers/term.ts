export const executeShell = (cmd: string, cwd: string) => {
  vim.cmd('new');
  vim.fn.termopen(cmd, {
    cwd
  });
};

export const npm = (packageName: string, installPath: string) => {
  executeShell(`npm install ${packageName}`, installPath);
};
