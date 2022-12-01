return {
  setup = function() end,
  config = function()
    require("ide.icons").global_icon_set = require("ide.icons.nerd_icon_set").new()

    local explorer = require "ide.components.explorer"
    local outline = require "ide.components.outline"
    local callhierarchy = require "ide.components.callhierarchy"
    local timeline = require "ide.components.timeline"
    local terminal = require "ide.components.terminal"
    local terminalbrowser = require "ide.components.terminal.terminalbrowser"
    local changes = require "ide.components.changes"
    local commits = require "ide.components.commits"
    local branches = require "ide.components.branches"
    local bookmarks = require "ide.components.bookmarks"

    require("ide").setup {
      icon_set = "nerd",
      components = {
        global_keymaps = {},
      },
      panels = {
        right = "right_panels",
      },
      panel_groups = {
        right_panels = { changes.Name, commits.Name, timeline.Name, branches.Name },
      },
      workspaces = {
        auto_open = "right",
      },
      panel_sizes = {
        right = 30,
        bottom = 15,
      },
    }
  end,
}
