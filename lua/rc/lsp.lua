local autocmd = require("utils.autocmd")
local map = require("utils.map")

local lspConfigs = require("rc.lspconfigs")

local function setup_servers()
	require("lspinstall").setup()
	local servers = require("lspinstall").installed_servers()
	for _, server in pairs(servers) do
    local config = lspConfigs[server]
    if config == nil then
      config = {}
    end
		require("lspconfig")[server].setup({})
	end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function()
	setup_servers() -- reload installed servers
	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end


autocmd({
	id = "LspFormat",
	events = "BufWritePre",
	filetypes = "*",
	command = function()
		vim.lsp.buf.formatting_sync()
	end,
})
map.nmap("<leader>f", ":lua vim.lsp.buf.formatting()<CR>", map.ns)