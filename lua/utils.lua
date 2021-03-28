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
____exports.map = {
    nmap = function(key, action, options)
        vim.api.nvim_set_keymap("n", key, action, options)
    end,
    imap = function(key, action, options)
        vim.api.nvim_set_keymap("i", key, action, options)
    end,
    tmap = function(key, action, options)
        vim.api.nvim_set_keymap("t", key, action, options)
    end
}
return ____exports
