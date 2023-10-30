-- `local/init.lua` is executed after all other config is loaded.

-- Setup lemonade clipboard for ssh
local ssh_connection
for w in vim.env.SSH_CONNECTION:gmatch "[^%s]+" do
  ssh_connection = w
  break
end

vim.g.clipboard = {
  name = "lemonade2",
  copy = {
    ["+"] = { "lemonade", "copy", "--host=" .. ssh_connection },
    ["*"] = { "lemonade", "copy", "--host=" .. ssh_connection },
  },
  paste = {
    ["+"] = { "lemonade", "paste", "--host=" .. ssh_connection },
    ["*"] = { "lemonade", "paste", "--host=" .. ssh_connection },
  },
  cache_enabled = 0,
}
