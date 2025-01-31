local M = {}

local settings = {
  debug = false,
}

-- Define metatable with __tostring
setmetatable(settings, {
  __tostring = function(t)
    local parts = {}
    for k, v in pairs(t) do
      table.insert(parts, k .. " = " .. tostring(v))
    end
    return "Config: { " .. table.concat(parts, ", ") .. " }"
  end,
})

love.conf = function(t)
  t.console = true
  t.window.width = 1600
  t.window.height = 1200
end

---Returns whether we're running in debug mode
---@return boolean
M.isDebug = function()
  return settings.debug == true
end

---Sets an option in the configuration, if it exists
---@param name string
---@param value any
M.set = function(name, value)
  if settings[name] ~= nil then
    settings[name] = value
  end
end

M.settings = settings

return M
