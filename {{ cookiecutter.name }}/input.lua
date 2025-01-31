local M = {}

local press_functions = {
  escape = function()
    love.event.quit()
  end,
}

local release_functions = {}
local mouse_press_functions = {}
local mouse_release_functions = {}

---Trigger a function on key press
---@param key love.KeyConstant The character of the released key
M.key_press = function(key)
  if press_functions[key] then
    press_functions[key]()
  end
end

---Trigger a function on key release
---@param key love.KeyConstant The character of the released key
M.key_release = function(key)
  if release_functions[key] then
    release_functions[key]()
  end
end

---Trigger a function on mouse press
---@param x number X position of the mouse when pressed
---@param y number Y position of the mouse when pressed
---@param button number The index of the button that was pressed
---@param presses number The number of presses for this event
M.mouse_press = function(x, y, button, presses)
  if mouse_press_functions[button] then
    mouse_press_functions[button](x, y, presses)
  end
end

---Trigger a function on mouse release
---@param x number X position of the mouse when released
---@param y number Y position of the mouse when released
---@param button number The index of the button that was released
---@param presses number The number of presses for this event
M.mouse_release = function(x, y, button, presses)
  if mouse_release_functions[button] then
    mouse_release_functions[button](x, y, presses)
  end
end

return M
