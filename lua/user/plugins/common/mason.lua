return {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall" },
  event = { "BufRead", "InsertEnter" },
  config = function()
    require("mason").setup {
      registries = {
        "lua:mason-custom-registry",
        "github:mason-org/mason-registry",
      },
    }

    local ensure_installed = {}

    if require("user.utils").is_win then
      table.insert(ensure_installed, "sed")
    end

    require("mason-tool-installer").setup {
      ensure_installed = ensure_installed,
      auto_update = false,
      run_on_start = true,
      start_delay = 3000,
    }
    require("mason-tool-installer").run_on_start()
  end,
}
