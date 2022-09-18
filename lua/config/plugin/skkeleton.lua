-- vim.keymap.set("i", "<Muhenkan>", "<Plug>(skkeleton-disable)")
-- vim.keymap.set("i", "<Henkan>", "<Plug>(skkeleton-enable)")
vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton-toggle)")

local host = "localhost"

if vim.fn.has "wsl" == 1 then
  host = vim.fn.system [[grep -o "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" /etc/resolv.conf]]
  host = string.sub(host, 1, host:len() - 1)
end

vim.fn["skkeleton#config"] {
  skkServerHost = host,
  skkServerPort = 1178,
}
