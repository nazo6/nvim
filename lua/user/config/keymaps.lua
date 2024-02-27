-- move
map("n", "k", "gk")
map("n", "gk", "k")
map("n", "j", "gj")
map("n", "gj", "j")

map({ "n", "v" }, "<S-h>", "^", { desc = "Move to first of line" })
map({ "n", "v" }, "<S-l>", "$", { desc = "Move to end of line" })

map("n", "<A-v>", "<C-w><C-v>")
map("n", "<A-s>", "<C-w><C-s>")

map({ "n", "x" }, "c", [["_c]])
map({ "n", "x" }, "d", [["_d]])

map("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>")

-- action
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Exit neovim" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

map("n", "<esc>", function()
  if vim.api.nvim_win_get_config(0).zindex then
    vim.cmd [[quit]]
  end
end, {
  desc = "close window if it's a popup",
})

map("n", "<leader>f", "<cmd>silent! !explorer.exe .<CR>", { desc = "Open explorer.exe" })

map("n", "<leader>re", "<cmd>Restart<CR>", { desc = "Restart neovim" })

-- inspired by term-edit.nvim, simple version
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    map("n", "i", function()
      local term_mode_pos_res = vim.fn.getcursorcharpos(0)
      local term_mode_pos = { term_mode_pos_res[2], term_mode_pos_res[3] }

      vim.cmd.startinsert()

      vim.defer_fn(function()
        local ins_mode_pos_res = vim.fn.getcursorcharpos(0)
        local ins_mode_pos = { ins_mode_pos_res[2], ins_mode_pos_res[3] }

        if term_mode_pos[1] == ins_mode_pos[1] then
          local diff = term_mode_pos[2] - ins_mode_pos[2]
          if diff < 0 then
            local keys = string.rep("<Left>", diff * -1)
            local k = vim.api.nvim_replace_termcodes(keys, true, true, true)
            vim.api.nvim_feedkeys(k, "n", false)
          end
          if diff > 0 then
            local keys = string.rep("<Right>", diff)
            local k = vim.api.nvim_replace_termcodes(keys, true, true, true)
            vim.api.nvim_feedkeys(k, "n", false)
          end
        end
      end, 10)
    end)
  end,
})

-- overwite default
map("n", "K", "<Nop>")
map("n", "<C-c>", "<Nop>")
