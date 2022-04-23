imap("<Henkan>", "<Plug>(eskk:enable)")
imap("<Henkan>", "<cmd>echo a<CR>")
imap("<Muhenkan>", "<Plug>(eskk:disable)")

vim.g["eskk#server"] = {
  host = "localhost",
  port = "1178",
  encoding = "utf-8",
}
