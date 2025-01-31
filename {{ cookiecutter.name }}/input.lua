local M = {}

local press_functions = {
  escape = function()
    love.event.quit()
  end,
}

local release_functions = {}

M.press = function(key)
  if press_functions[key] then
    press_functions[key]()
  end
end

M.release = function(key)
  if release_functions[key] then
    release_functions[key]()
  end
end

return M
