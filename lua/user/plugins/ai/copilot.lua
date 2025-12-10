if not Args.feature.ai.copilot or Args.feature.vscode then
  return {}
end

return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "copilotlsp-nvim/copilot-lsp" },
    },
    event = { "BufRead", "BufNewFile" },
    cmd = { "Copilot" },
    keys = {
      { mode = "n", "<leader>cp", "<cmd>Copilot panel<CR>" },
    },
    config = function()
      require("copilot").setup {
        suggestion = {
          enabled = false,
        },
        filetypes = {
          yaml = true,
          markdown = true,
        },
        nes = {
          enabled = true,
          keymap = {
            accept_and_goto = "<leader>p",
            accept = false,
            dismiss = "<Esc>",
          },
        },
        -- Code from here: https://github.com/copilotlsp-nvim/copilot-lsp/issues/59
        server_opts_overrides = {
          on_init = function(client)
            local au = vim.api.nvim_create_augroup("copilotlsp.init", { clear = true })
            local debounce_normal = vim.g.copilot_nes_debounce or 500 -- 500ms
            local debounce_insert = vim.g.copilot_nes_debounce_insert or 5000 -- 5s

            local nes = require "copilot-lsp.nes"

            -- A resettable debouncer that lets us vary the delay per call.
            -- This replaces the library debounce so we can cancel prior timers across
            -- different event types (Insert vs Normal) using one shared timer.
            local function make_resettable_debouncer(fn)
              local timer = vim.uv.new_timer()
              return function(delay, ...)
                local argv = vim.F.pack_len(...)
                if timer:is_active() then
                  timer:stop()
                end
                timer:start(delay, 0, function()
                  timer:stop()
                  vim.schedule_wrap(fn)(vim.F.unpack_len(argv))
                end)
              end
            end

            local debounced_request = make_resettable_debouncer(nes.request_nes)

            -- Normal-mode related triggers: short debounce
            vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
              callback = function()
                debounced_request(debounce_normal, client)
              end,
              group = au,
            })

            -- Insert-mode triggers: long debounce to suppress immediate suggestion
            vim.api.nvim_create_autocmd({ "InsertEnter", "TextChangedI" }, {
              callback = function()
                debounced_request(debounce_insert, client)
              end,
              group = au,
            })

            -- didFocus notification identical to upstream
            vim.api.nvim_create_autocmd("BufEnter", {
              callback = function()
                local td_params = vim.lsp.util.make_text_document_params()
                client:notify("textDocument/didFocus", { textDocument = { uri = td_params.uri } })
              end,
              group = au,
            })
          end,
        },
      }
    end,
  },
}
