return {
  init = function()
    vim.keymap.set("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { desc = "[dapui] Toggle" })
    vim.keymap.set("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", { desc = "[dapui] Eval" })
    vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>", { desc = "[dap] Continue" })
    vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>", { desc = "[dap] Step over" })
    vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>", { desc = "[dap] Step into" })
    vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>", { desc = "[dap] Step out" })
    vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { desc = "[dap] Toggle breakpoint" })
    vim.keymap.set(
      "n",
      "<leader>bc",
      ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
      {}
    )
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
