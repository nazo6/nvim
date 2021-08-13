autocmdFunctions = {}
_G.callAutoCmdFunction = function(id)
  autocmdFunctions[id]()
end

return function(args)
  local id = args.id
  local command = args.command
  local events = args.events
  local filetypes = args.filetypes or ""
  local bufonly = args.bufonly or false

  local commandText = ((type(command) == 'string') and command) or (('lua callAutoCmdFunction("' .. id) .. '")')
  if type(command) ~= 'string' then
    autocmdFunctions[id] = command
  end
  local eventsText = ((type(events) == 'string') and events) or table.concat(events, ',')
  local fileTypesText = ((type(filetypes) == 'string') and filetypes) or table.concat(filetypes, ',')
  if bufonly then
    fileTypesText = '<buffer>'
  end

  vim.cmd('augroup ' .. tostring(id))
  vim.cmd('autocmd!' .. (bufonly and ' * <buffer>' or ''))
  vim.cmd('autocmd ' .. eventsText .. ' ' .. fileTypesText .. ' ' .. commandText)
  vim.cmd 'augroup END'
end
