return {
  "ActivityWatch/aw-watcher-vim",
  init = function()
    if vim.g.plugin_enabled["aw-watcher-vim"] == false then
      return
    end

    vim.api.nvim_create_autocmd({ "BufReadPre", "InsertEnter" }, {
      group = vim.api.nvim_create_augroup("setup-aw", {}),
      once = true,
      callback = function()
        vim.g.aw_apiurl_host = require("user.utils").get_host()
        require("lazy").load { plugins = { "aw-watcher-vim" } }
        vim.cmd [[silent AWStart]]
      end,
    })
  end,
}
