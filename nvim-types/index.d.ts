declare namespace vim {
  /**
   * Invokes vim-function or user-function.
   *
   * To call autoload functions, use the syntax:
   *   vim.fn['some#function']({...})
   */
  const fn: IFn;
  /**
   * Invokes Nvim |API| function {func} with arguments {...}.
   * Example: call the "nvim_get_current_line()" API function:
        print(tostring(vim.api.nvim_get_current_line()))
   */
  const api: IApi;
  const loop: ILoop;
  /**
   * Nvim includes a function for highlighting a selection on yank (see for example https://github.com/machakann/vim-highlightedyank). To enable it, add
   *   au TextYankPost * silent! lua vim.highlight.on_yank()
   * to your `init.vim`. You can customize the highlight group and the duration of the highlight via
   *   au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
   * If you want to exclude visual selections from highlighting on yank, use
   *   au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}
   */
  const highlight: IHighlight;
}
