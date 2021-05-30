export const executeShell = (cmd: string, cwd: string) => {
  vim.cmd('new');
  vim.fn.termopen(cmd, {
    cwd
  });
};
