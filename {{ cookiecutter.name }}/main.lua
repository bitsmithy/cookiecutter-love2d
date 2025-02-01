local logger = require("logger")
local conf = require("conf")

local world = require("world")
local input = require("input")
local entities = require("entities")

local NAME = "{{ cookiecutter.name }}"

love.load = function()
  love.window.setTitle(NAME)

  -- Check all command line arguments
  for i = 1, #arg do
    if arg[i] == "--debug" then
      logger.setLevel("debug")
      conf.set("debug", true)
    end
  end

  logger.debug(tostring(conf.settings))
end

love.draw = function()
  if conf.isDebug() then
    love.graphics.print("Mouse Coordinates: " .. love.mouse.getX() .. ", " .. love.mouse.getY(), 0, 0)
  end

  love.graphics.print("Hello " .. NAME .. "!", 400, 300)

  for _, e in ipairs(entities) do
    if e.draw then
      e:draw()
    end
  end
end

love.focus = function(focused)
  logger.debug("Focus state changed: " .. tostring(focused))
end

love.keypressed = function(key)
  logger.debug("Key pressed: " .. key)
  input.key.press(key)
end

love.keyreleased = function(key)
  logger.debug("Key released: " .. key)
  input.key.release(key)
end

love.mousepressed = function(x, y, button, _, presses)
  if conf.isDebug() then
    local msg = "Mouse " .. button .. " pressed @ (" .. x .. ", " .. y .. ")"
    if presses > 1 then
      msg = msg .. " " .. presses .. " times"
    end
    logger.debug(msg)
  end
  input.mouse.press(x, y, button, presses)
end

love.mousereleased = function(x, y, button, _, presses)
  logger.debug(function()
    local msg = "Mouse " .. button .. " released @ (" .. x .. ", " .. y .. ")"
    if presses > 1 then
      msg = msg .. " " .. presses .. " times"
    end

    return msg
  end)
  input.mouse.release(x, y, button, presses)
end

love.update = function(dt)
  world:update(dt)

  for _, e in ipairs(entities) do
    if e.update then
      e:update(dt)
    end
  end
end
