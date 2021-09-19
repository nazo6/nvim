local map = require("utils.map")

if vim.fn.has("win32") == 1 then
  vim.g.floaterm_shell = "pwsh.exe"
end

map.tmap("<ESC>", "<C-\\><C-n>", map.n)
map.nmap("<C-t>n", ":FloatermNew --wintype=split --height=0.3<CR>", map.ns)
map.tmap("<C-t>h", "<C-\\><C-n>:FloatermHide<CR>", map.ns)
map.tmap("<C-t>x", "<C-\\><C-n>:FloatermKill<CR>", map.ns)
map.nmap("<C-t>s", ":FloatermShow<CR>", map.ns)
map.nmap("<C-t>k", ":FloatermPrev<CR>", map.ns)
map.nmap("<C-t>j", ":FloatermNext<CR>", map.ns)
map.nmap("<C-t>k", "<C-\\><C-n>:FloatermPrev<CR>", map.ns)
map.tmap("<C-t>j", "<C-\\><C-n>:FloatermNext<CR>", map.ns)
map.nmap("<leader>g", ":FloatermNew --width=0.8 --height=0.9 gitui<CR>", map.ns)
