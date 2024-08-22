--- In this modules, global `Args` variable is defined.
--- This value can be thought as "Argument of config". By overriding these values in local `early-init.lua`, you can easily customize some components in config.
--- This value should be only changed in `early-init.lua`.
Args = {
  --- "feature" provides way to easily disable/enable component of config.
  feature = {
    --- Enables copilot related plugins
    copilot = true,
    --- Force enable osc52 clipboard. Useful in ssh environment.
    osc52 = vim.env.SSH_CLIENT ~= nil,
    --- Enables denops powered plugins. Useful in environment that deno is not available.
    denops = true,
    vscode = not not vim.g.vscode,
  },
  lsp = {
    --- Defines `local server` that is configured even if server is not installed by mason.
    local_servers = { "satysfi", "nushell" },
  },
}
