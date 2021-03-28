--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.utils = {
    setOption = function(key, value)
        vim.api.nvim_set_option(key, value)
    end,
    getOption = function(key)
        return vim.api.nvim_get_option(key)
    end
}
return ____exports
