vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
  local util = require "vim.lsp.util"

  config = config or {}
  config.border = "rounded"
  config.focus_id = ctx.method

  if not (result and result.contents) then
    return
  end
  local markdown_lines = util.convert_input_to_markdown_lines(result.contents, {})
  markdown_lines = util.trim_empty_lines(markdown_lines)
  if vim.tbl_isempty(markdown_lines) then
    return
  end
  if #markdown_lines == 1 and markdown_lines[1] == "" then
    return
  end
  return util.open_floating_preview(markdown_lines, "markdown", config)
end
