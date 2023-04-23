vim.opt.guifont = "PlemolJPConsole NF:h12"

if vim.g.neovide then
  vim.g.restart_program = "neovide --"
end

local restart_startup_cmd = [[":lua require\"user.restart_init\""]]

vim.api.nvim_create_user_command("Restart", function()
  require("possession.session").save("restart", { no_confirm = true })
  vim.cmd [[silent! bufdo bwipeout]]
  vim.cmd([[silent! !]] .. vim.g.restart_program .. [[ -c ]] .. restart_startup_cmd)
  vim.cmd [[qa!]]
end, {})
