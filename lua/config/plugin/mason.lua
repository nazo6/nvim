require("mason").setup()
require("mason-lspconfig").setup()

local index = require "mason-registry.index"
index["sed"] = "mason-custom-registry.sed"
index["gitui"] = "mason-custom-registry.gitui"
index["ripgrep"] = "mason-custom-registry.ripgrep"
