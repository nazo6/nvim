-- File specific carg-compete commands

local log = require "overseer.log"
local overseer = require "overseer"

---@type overseer.TemplateFileDefinition
local tmpl = {
  priority = 40,
  params = {
    args = { type = "list", delimiter = " " },
    cwd = { optional = true },
  },
  builder = function(params)
    local cmd = { "cargo", "compete" }
    return {
      args = params.args,
      cmd = cmd,
      cwd = params.cwd,
    }
  end,
}

---@param opts overseer.SearchParams
---@return nil|string
local function get_compete_toml(opts)
  return vim.fs.find("compete.toml", { upward = true, type = "file", path = opts.dir })[1]
end

return {
  cache_key = function(opts)
    return opts.dir
  end,
  condition = {
    callback = function(opts)
      if vim.fn.executable "cargo-compete" == 0 then
        return false, 'Command "cargo-compete" not found'
      end
      if not get_compete_toml(opts) then
        return false, 'No "compete.toml" file found'
      end
      if opts.filetype ~= "rust" then
        return false, "Not rust filetype"
      end
      return true
    end,
  },
  generator = function(opts, cb)
    local ret = {}

    local file = vim.fn.expand "%:p"
    if not file then
      log:error "Not valid file"
      cb(ret)
      return
    end

    table.insert(
      ret,
      overseer.wrap_template(
        tmpl,
        { name = "cargo-compete test" },
        { args = { "test", "--src", file }, cwd = opts.dir }
      )
    )
    table.insert(
      ret,
      overseer.wrap_template(
        tmpl,
        { name = "cargo-compete submit" },
        { args = { "submit", "--src", file }, cwd = opts.dir }
      )
    )

    cb(ret)
  end,
}
