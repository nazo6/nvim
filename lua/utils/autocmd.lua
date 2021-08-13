autocmdFunctions = {}
_G.callAutoCmdFunction = function(id)
	autocmdFunctions[id]()
end

--@param id string
--@param events string[] | string
--@param filetypes string[] | string
--@param command string | function
return function(args)
	local id = args.id
	local command = args.command
	local events = args.events
	local filetypes = args.filetypes
	local commandText = ((type(command) == "string") and command) or (('lua callAutoCmdFunction("' .. id) .. '")')
	if type(command) ~= "string" then
		autocmdFunctions[id] = command
	end
	local eventsText = ((type(events) == "string") and events) or table.concat(events, ",")
	local fileTypesText = ((type(filetypes) == "string") and filetypes) or table.concat(filetypes, ",")
	vim.cmd("augroup " .. tostring(id))
	vim.cmd("autocmd!")
	vim.cmd((((("autocmd " .. eventsText) .. " ") .. fileTypesText) .. " ") .. commandText)
	vim.cmd("augroup END")
end
