local create_setup = require("user.lsp.config-builder").create_setup
local node_or_deno = require("user.shared.lsp-selector.web").judge

local deno_client = nil

-- HACK: Overrides vim.uri_to_bufnr to handle deno:/ protocol.
-- For default lsp handler, lspconfig automatically sets this handler,
-- but if LSP methods is called from other places (ex: glance.nvim), this does not work.

---@return nil|vim.lsp.Client
local function get_deno_client()
  if deno_client == nil then
    deno_client = vim.lsp.get_clients({ name = "denols" })[1]
  end
  return deno_client
end

local function virtual_text_document_handler(bufnr, res, client)
  if not res then
    return nil
  end

  local lines = vim.split(res.result, "\n")

  local current_buf = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  if #current_buf ~= 0 then
    return nil
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
  vim.api.nvim_set_option_value("readonly", true, { buf = bufnr })
  vim.api.nvim_set_option_value("modified", false, { buf = bufnr })
  vim.api.nvim_set_option_value("modifiable", false, { buf = bufnr })
  -- HACK: If buflisted is 0, glance executes `:e` and it causes to open empty buffer.
  vim.api.nvim_set_option_value("buflisted", true, { buf = bufnr })
  vim.lsp.buf_attach_client(bufnr, client.id)
end

return create_setup(function()
  local uri_to_bufnr_orig = vim.uri_to_bufnr

  vim.uri_to_bufnr = function(uri)
    local buf = uri_to_bufnr_orig(uri)

    if uri:match "^deno:" then
      local client = get_deno_client()
      if client ~= nil then
        local params = {
          textDocument = {
            uri = uri,
          },
        }
        local result = client:request_sync("deno/virtualTextDocument", params)
        virtual_text_document_handler(buf, result, client)
      end
    end

    return buf
  end

  return {
    root_dir = function(bufnr, cb)
      if node_or_deno(bufnr).type == "deno" then
        cb(node_or_deno(bufnr).root)
      end
    end,
    settings = {
      enable = true,
      lint = true,
      unstable = true,
    },
    on_attach = function(client)
      client.server_capabilities.executeCommandProvider = true
    end,
  }
end)
