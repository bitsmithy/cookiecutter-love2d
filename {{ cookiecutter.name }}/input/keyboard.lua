local M = {}

local logger = require("logger")

---A table that maps keypresses to functions that execute
---@type table<love.KeyConstant, fun()>
local press_fns = {
  escape = function()
    love.event.quit()
  end,
}

---A table that maps key releases to functions that execute
---@type table<love.KeyConstant, fun()>
local release_fns = {}

---Trigger a function on key press
---@param key love.KeyConstant The character of the released key
M.press = function(key)
  if press_fns[key] then
    press_fns[key]()
  end
end

---Trigger a function on key release
---@param key love.KeyConstant The character of the released key
M.release = function(key)
  if release_fns[key] then
    release_fns[key]()
  end
end

---Setup keyboard options
---@param debug boolean Whether to set up in debug mode
M.setup = function(debug)
  if debug then
    logger.debug("Keyboard setup complete")
  end
end

return M
