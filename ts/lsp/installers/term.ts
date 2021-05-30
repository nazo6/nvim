export const executeShell = (cmd: string, cwd: string, onExit: (exitCode: number) => void) => {
  vim.cmd('new');
  vim.fn.termopen(cmd, {
    cwd,
    on_exit: (_: number, exitCode: number) => {
      onExit(exitCode);
    }
  });
};
