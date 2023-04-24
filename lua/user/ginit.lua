vim.opt.guifont = "PlemolJPConsole NF:h12"

local restart_cmd = nil

local load_restart_init_cmd = [=["lua require[[user.restart_init]]"]=]

if vim.g.neovide then
  if vim.fn.has "wsl" == 1 then
    restart_cmd = "silent! !nohup neovide.exe --wsl -- -c '" .. load_restart_init_cmd .. "' &"
  else
    restart_cmd = "silent! !neovide.exe -- -c " .. load_restart_init_cmd
  end
elseif vim.g.fvim_loaded then
  vim.opt.guifont = "PlemolJPConsole NF:h15"

  if vim.fn.has "wsl" == 1 then
    restart_cmd = "silent! !nohup fvim.exe --wsl -c '" .. load_restart_init_cmd .. "' &"
  else
    restart_cmd = "fvim.exe -c " .. load_restart_init_cmd
  end
end

vim.api.nvim_create_user_command("Restart", function()
  if restart_cmd == nil then
    vim.cmd [[echoerr "Restart command is not set"]]
    return
  end
  vim.notify(restart_cmd)

  require("possession.session").save("restart", { no_confirm = true })
  vim.cmd [[silent! bufdo bwipeout]]
  vim.fn.jobstart(restart_cmd, { detach = true })
end, {})
