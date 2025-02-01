local M = {}

local logger = require("logger")

---A table that maps functions to mouse clicks by button ID
---@type table<number, fun(number, number, number)>
local press_fns = {}

---A table that maps functions to mouse releases by button ID
---@type table<number, fun(number, number, number)>
local release_fns = {}

---Trigger a function on mouse press
---@param x number X position of the mouse when pressed
---@param y number Y position of the mouse when pressed
---@param button number The index of the button that was pressed
---@param presses number The number of presses for this event
M.press = function(x, y, button, presses)
  if press_fns[button] then
    press_fns[button](x, y, presses)
  end
end

---Trigger a function on mouse release
---@param x number X position of the mouse when released
---@param y number Y position of the mouse when released
---@param button number The index of the button that was released
---@param presses number The number of presses for this event
M.release = function(x, y, button, presses)
  if release_fns[button] then
    release_fns[button](x, y, presses)
  end
end

---Setup mouse options
---@param debug boolean Whether to set up in debug mode
M.setup = function(debug)
  love.mouse.setCursor(love.mouse.getSystemCursor("arrow"))
  love.mouse.setVisible(true)

  if debug then
    logger.debug("Mouse setup complete")
  end
end

return M
