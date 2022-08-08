local Pkg = require "mason-core.package"
local _ = require "mason-core.functional"
local platform = require "mason-core.platform"
local github = require "mason-core.managers.github"

local coalesce, when = _.coalesce, _.when

return Pkg.new {
  name = "ripgrep",
  desc = [[ripgrep is a line-oriented search tool that recursively searches the current directory for a regex pattern.]],
  homepage = "https://github.com/BurntSushi/ripgrep",
  categories = { Pkg.Cat.Runtime },
  languages = {},
  ---@async
  ---@param ctx InstallContext
  install = function(ctx)
    local repo = "BurntSushi/ripgrep"
    local source = platform.when {
      unix = function()
        return github.untargz_release_file {
          repo = repo,
          asset_file = function(release)
            local target = coalesce(
              when(platform.is.mac_x64, "ripgrep-%s-x86_64-apple-darwin.tar.gz"),
              when(platform.is.linux_x64, "ripgrep-%s-x86_64-unknown-linux-musl.tar.gz")
            )
            return target:format(release)
          end,
        }
      end,
      win = function()
        return github.unzip_release_file {
          repo = repo,
          asset_file = function(release)
            local target = coalesce(when(platform.arch == "x64", "ripgrep-%s-x86_64-pc-windows-msvc.zip"))
            return target:format(release)
          end,
        }
      end,
    }
    source.with_receipt()

    platform.when {
      unix = function()
        local unzipped_dir = _.gsub("%.tar.gz$", "", source.asset_file)
        ctx.fs:rename(unzipped_dir, "ripgrep")
        ctx:link_bin("rg", "ripgrep/rg")
      end,
      win = function()
        local unzipped_dir = _.gsub("%.zip$", "", source.asset_file)
        ctx.fs:rename(unzipped_dir, "ripgrep")
        ctx:link_bin("rg", "ripgrep/rg.exe")
      end,
    }
  end,
}
