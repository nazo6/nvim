return {
  unPinMain = function(client)
    client.request("workspace/executeCommand", {
      command = "typst-lsp.doPinMain",
      arguments = { "detached" },
    }, function(err, _result, _ctx)
      if err ~= nil then
        vim.notify("Error unpinning typst-lsp: " .. vim.inspect(error), vim.log.levels.ERROR)
      end
    end)
  end,
  pinMain = function(client, uri)
    local typst_lsp_client = vim.lsp.get_clients {
      name = "typst_lsp",
    }
    if #typst_lsp_client == 0 then
      vim.notify("No typst-lsp client found", vim.log.levels.ERROR)
      return
    end
    client.request("workspace/executeCommand", {
      command = "typst-lsp.doPinMain",
      arguments = { uri },
    }, function(err, _result, _ctx)
      if err ~= nil then
        vim.notify("Error pinning typst-lsp: " .. vim.inspect(error), vim.log.levels.ERROR)
      end
    end)
  end,
}
