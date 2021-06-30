require('bufferline').setup({
  options: {
    offsets: [{ filetype: 'coc-explorer', text: 'Explorer', text_align: 'center' }],
    diagnostics: 'nvim_lsp'
  }
});
