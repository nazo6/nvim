return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "rcarriga/nvim-dap-ui", dependencies = { { "nvim-neotest/nvim-nio" } } },
    { "theHamsta/nvim-dap-virtual-text" },
    { "jay-babu/mason-nvim-dap.nvim", dependencies = { "williamboman/mason.nvim" } },
  },
  init = function()
    map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { desc = "[dapui] Toggle" })
    map("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", { desc = "[dapui] Eval" })
    map("n", "<F5>", ":lua require'dap'.continue()<CR>", { desc = "[dap] Continue" })
    map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { desc = "[dap] Step over" })
    map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { desc = "[dap] Step into" })
    map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { desc = "[dap] Step out" })
    map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "[dap] Toggle breakpoint" })
    map("n", "<leader>bc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {})
  end,
  config = function()
    require("nvim-dap-virtual-text").setup {}

    vim.schedule(function()
      require("dapui").setup()
      require("mason-nvim-dap").setup {
        handlers = {},
      }
      require("dap.ext.vscode").load_launchjs(nil, {
        coreclr = { "cs" },
      })
    end)
  end,
}
