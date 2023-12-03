return {
  nut = {
    buf = {
      diagnostic_count = require("nougat.nut.buf.diagnostic_count").create,
      filename = require("nougat.nut.buf.filename").create,
      filestatus = require("nougat.nut.buf.filestatus").create,
      filetype = require("nougat.nut.buf.filetype").create,
      icon = require("user.plugins.appearance.nougat.nut.buf.icon").create,
    },
    git = {
      branch = require("nougat.nut.git.branch").create,
      status = require "nougat.nut.git.status",
    },
    tab = {
      tablist = {
        tabs = require("nougat.nut.tab.tablist").create,
        close = require("nougat.nut.tab.tablist.close").create,
        icon = require("nougat.nut.tab.tablist.icon").create,
        label = require("nougat.nut.tab.tablist.label").create,
        modified = require("nougat.nut.tab.tablist.modified").create,
      },
    },
    mode = require("user.plugins.appearance.nougat.nut.mode").create,
    spacer = require("nougat.nut.spacer").create,
    truncation_point = require("nougat.nut.truncation_point").create,
  },
  ---@type nougat.color
  color = require("nougat.color").get(),
}
