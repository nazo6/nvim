-- Global plugin settings
local ok, impatient = pcall(require, "impatient")
if ok then
  impatient.enable_profile()
end

-- workaraound for https://github.com/neovim/neovim/issues/17762
if require("config.utils").is_win then
  os.execute = function(cmd)
    vim.fn.system(cmd)
    return vim.v.shell_error
  end
  local spawn_orig = vim.loop.spawn
  vim.loop.spawn = function(orig_path, options, on_exit)
    local path = vim.fn.exepath(orig_path)
    local handle, pid = spawn_orig(path, options, on_exit)

    return handle, pid
  end
end
