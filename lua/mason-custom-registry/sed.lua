local Pkg = require "mason-core.package"
local platform = require "mason-core.platform"
local _ = require "mason-core.functional"
local std = require "mason-core.managers.std"

return Pkg.new {
  name = "sed",
  desc = [[sed (stream editor) is a non-interactive command-line text editor]],
  homepage = "https://www.gnu.org/software/sed",
  languages = {},
  categories = { Pkg.Cat.Runtime },
  ---@async
  ---@param ctx InstallContext
  install = function(ctx)
    local url = "https://packages.chocolatey.org/sed.4.8.nupkg"
    platform.when {
      win = function()
        std.download_file(url, "archive.zip")
        std.unzip("archive.zip", ".")
        ctx.fs:rename("tools/install/sed-windows-master/sed-4.8-x64.exe", "sed.exe")
      end,
    }
    ctx:link_bin("sed", platform.is.win and "sed.exe" or "sed")
    ctx.receipt:with_primary_source {
      type = "unmanaged",
    }
  end,
}
