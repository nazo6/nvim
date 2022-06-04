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
end

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
vim.g.loaded_matchparen = 1
