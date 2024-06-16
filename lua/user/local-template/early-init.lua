-- `local/early-init.lua` is executed before all other config is loaded.

-- For example, you can change `Args`.
-- For more detail, see `args.lua`.
Args.feature.copilot = false
vim.list_extend(Args.lsp.local_servers, { "nil_ls" })
