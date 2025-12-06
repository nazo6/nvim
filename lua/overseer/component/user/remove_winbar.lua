---@type overseer.ComponentFileDefinition
return {
  desc = "Include a description of your component",
  constructor = function()
    ---@type overseer.ComponentSkeleton
    return {
      on_start = function(self, task)
        local bufnr = task:get_bufnr()
        if not bufnr then
          print "remove_winbar component: no buffer found for task"
        end
        self.au_id = vim.api.nvim_create_autocmd("BufWinEnter", {
          callback = function(args)
            if args.buf == bufnr then
              print(args.win)
              vim.api.nvim_set_option_value("winbar", "", { scope = "local", win = args.win })
            end
          end,
        })
      end,
      on_dispose = function(self)
        if self.au_id then
          vim.api.nvim_del_autocmd(self.au_id)
        end
      end,
    }
  end,
}
