const win = vim.fn.has('win32') !== 0;

export const executeShell = (
  cmd: string,
  cwd: string,
  onExit: (exitCode: number) => void,
  options?: { wsl: boolean }
) => {
  const defaultShell = vim.o.shell;
  if (options && options.wsl && win) {
    vim.o.shell = 'wsl';
  }
  vim.cmd('new');
  vim.fn.termopen(cmd, {
    cwd,
    on_exit: (_: number, exitCode: number) => {
      vim.o.shell = defaultShell;
      onExit(exitCode);
    }
  });
};
