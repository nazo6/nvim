return {
  "akinsho/toggleterm.nvim",

  cmd = { "ToggleTerm", "ToggleTermOpen" },
  init = function()
    map("n", [[<c-\>]], function()
      vim.cmd 'execute v:count1 . "ToggleTerm"'
    end, { desc = "[toggleterm] toggle" })
    map("t", [[<c-\>]], "<cmd>ToggleTerm<cr>", { desc = "[toggleterm] toggle" })
    map("t", "<ESC>", "<C-\\><C-n>")

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      group = vim.api.nvim_create_augroup("terminal", { clear = true }),
      callback = function()
        map("n", "q", [[<cmd>q<CR>]], { buffer = 0, desc = "Quit terminal buffer" })
      end,
    })
  end,
  config = function()
    require("toggleterm").setup {
      hide_numbers = false,
      shade_filetypes = {},
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      close_on_exit = false,
      on_open = function()
        vim.fn.timer_start(1, function()
          vim.cmd "startinsert!"
        end)
      end,
      shell = function()
        local shell = vim.o.shell

        if require("user.shared.utils.system").is_win then
          if vim.env.SHELL == nil then
            shell = "pwsh.exe"
          end
        end

        return shell
      end,
    }
  end,
}
