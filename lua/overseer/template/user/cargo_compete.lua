-- Project-wide cargo-compete commands

local overseer = require "overseer"

---@type overseer.TemplateFileDefinition
local input_tmpl = {
  priority = 41,
  params = {
    args = { type = "list", delimiter = " " },
    cwd = { optional = true },
    contest = { type = "string" },
  },
  builder = function(params)
    local cmd = { "cargo", "compete" }
    local args = vim.list_extend(params.args, { params.contest })
    return {
      args = args,
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
    return get_compete_toml(opts)
  end,
  condition = {
    callback = function(opts)
      if vim.fn.executable "cargo-compete" == 0 then
        return false, 'Command "cargo-compete" not found'
      end
      if not get_compete_toml(opts) then
        return false, 'No "compete.toml" file found'
      end
      return true
    end,
  },
  generator = function(opts, cb)
    local ret = {}

    table.insert(
      ret,
      overseer.wrap_template(input_tmpl, { name = "cargo-compete new" }, { args = { "new" }, cwd = opts.dir })
    )
    table.insert(
      ret,
      overseer.wrap_template(
        input_tmpl,
        { name = "cargo-compete participate" },
        { args = { "participate" }, cwd = opts.dir }
      )
    )

    cb(ret)
  end,
}
