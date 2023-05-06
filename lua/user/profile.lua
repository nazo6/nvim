local should_profile = os.getenv "NVIM_PROFILE"
if should_profile ~= nil then
  vim.opt.runtimepath:append(vim.fn.stdpath "config" .. "/profile.nvim")

  require("profile").instrument_autocmds()
  if should_profile == "start" then
    require("profile").start "*"
  else
    require("profile").instrument "*"
  end

  local function toggle_profile()
    local prof = require "profile"
    if prof.is_recording() then
      prof.stop()
      vim.ui.input({ prompt = "Save profile to:", completion = "file", default = "profile.json" }, function(filename)
        if filename then
          prof.export(filename)
          vim.notify(string.format("Wrote %s", filename))
        end
      end)
    else
      prof.start "*"
    end
  end
  vim.api.nvim_set_keymap("n", "<f1>", "", { callback = toggle_profile })
end
