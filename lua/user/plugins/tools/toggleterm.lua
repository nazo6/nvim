return {
  "akinsho/toggleterm.nvim",

  cmd = { "ToggleTerm", "ToggleTermOpen" },
  init = function()
    map("n", [[<c-\>]], function()
      local tmp = vim.opt.shellcmdflag
      if require("user.shared.utils.system").is_msys2 then
        vim.opt.shellcmdflag = "-li"
      end
      vim.cmd 'execute v:count1 . "ToggleTerm"'
      vim.opt.shellcmdflag = tmp
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

        -- In windows native, SHELL env variable does not exist. So vim.opt.shell will be automatically set to 'cmd.exe'.
        -- I would like to use pwsh instead, so set it.
        if require("user.shared.utils.system").is_win then
          if vim.env.SHELL == nil then
            if vim.env.NU_VERSION ~= nil then
              shell = "nu.exe"
            else
              shell = "pwsh.exe"
            end
          end
        end
        return shell
      end,
    }
  end,
}
