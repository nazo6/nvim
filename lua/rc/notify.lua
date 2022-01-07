vim.notify = function(...)
  local opts = { ... }
  if string.match(opts[1], "matching root directory not detected") ~= nil then
    return
  end
  if opts[2] == "error" or opts[2] == 4 then
    opts[1] = opts[1] .. "\n" .. debug.traceback()
  end
  (require "notify")(unpack(opts))
end
