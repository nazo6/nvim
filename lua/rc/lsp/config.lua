local autocmd = require 'utils.autocmd'
local map = require 'utils.map'

return {
  on_attach = function(_, bufnr)
    local nmap = map.get_buf_map(bufnr, 'n')
    require('lsp_signature').on_attach()

    nmap('K', ':Lspsaga hover_doc<CR>', map.ns)
    nmap('<leader>a', ':Lspsaga code_action<CR>', map.ns)
    nmap('<leader>rn', ':Lspsaga rename<CR>', map.ns)
    nmap('gd', ':Lspsaga preview_definition<CR>', map.ns)
    nmap('<leader>f', ':lua vim.lsp.buf.formatting()<CR>', map.ns)

    autocmd {
      id = 'LspFormat',
      events = 'BufWritePre',
      bufonly = true,
      command = function()
        vim.lsp.buf.formatting_sync()
      end,
    }
  end,
}
