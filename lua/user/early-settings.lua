if require("user.utils").is_win then
  -- workaraound for https://github.com/neovim/neovim/issues/17762
  os.execute = function(cmd)
    vim.fn.system(cmd)
    return vim.v.shell_error
  end
  local spawn_orig = vim.loop.spawn
  vim.loop.spawn = function(orig_path, options, on_exit)
    local path = orig_path
    local handle_chk, _ = spawn_orig(path, {}, function() end)
    if not handle_chk then
      path = orig_path .. ".cmd"
    end

    local handle, pid = spawn_orig(path, options, on_exit)

    return handle, pid
  end
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end

vim.g.mapleader = " "
