--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____utils = require("utils")
local utils = ____utils.utils
local function loadDein()
    local dein_dir = vim.fn.expand("~/.cache/dein")
    local dein_repo_dir = tostring(dein_dir) .. "/repos/github.com/Shougo/dein.vim"
    utils.setOption(
        "runtimepath",
        (dein_repo_dir .. ",") .. tostring(
            utils.getOption("runtimepath")
        )
    )
    if vim.fn["dein#load_state"](dein_dir) == 1 then
        vim.fn["dein#begin"](dein_dir)
        local rc_dir = vim.fn.expand("~/.config/nvim")
        local toml = tostring(rc_dir) .. "/dein.toml"
        vim.fn["dein#load_toml"](toml)
        vim.fn["dein#end"]()
        local ____ = vim.fn["dein#save_state"]
    end
    if vim.fn["dein#check_install"]() ~= 0 then
        vim.fn["dein#install"]()
    end
    local removed_plugins = vim.fn["dein#check_clean"]()
    if vim.fn.len(removed_plugins) > 0 then
        vim.fn.map(removed_plugins, "delete(v:val, 'rf')")
        vim.fn["dein#recache_runtimepath"]()
    end
end
____exports.default = loadDein
return ____exports
