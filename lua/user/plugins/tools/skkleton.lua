return {
  {
    "vim-skk/skkeleton",
    keys = { { "<C-j>", mode = { "i", "c" }, "<Plug>(skkeleton-enable)" } },
    enabled = Args.feature.denops,
    dependencies = { "vim-denops/denops.vim", "delphinus/skkeleton_indicator.nvim" },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "skkeleton-initialize-pre",
        callback = function()
          local server = "127.0.0.1"

          if Args.feature.wsl_nat then
            if vim.fn.has "wsl" == 1 then
              server =
                vim.fn.system [[ip route | grep 'default via' | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}']]
              server = server:gsub("%s+", "")
            end
          end

          local encoding = "utf-8"
          if vim.fn.has "mac" == 1 then
            encoding = "euc-jp"
          end

          vim.fn["skkeleton#config"] {
            eggLikeNewline = true,
            registerConvertResult = true,
            sources = { "skk_server" },
            skkServerReqEnc = encoding,
            skkServerResEnc = encoding,
            skkServerHost = server,
          }
        end,
      })
    end,
    config = function()
      require("skkeleton_indicator").setup {}
    end,
  },
}
