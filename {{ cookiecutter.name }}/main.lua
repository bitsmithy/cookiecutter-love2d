local logger = require("logger")
local conf = require("conf")

local world = require("world")
local input = require("input")

function love.load()
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

  love.graphics.print("Hello {{ cookiecutter.name }}!", 400, 300)
end

love.focus = function(focused)
  logger.debug("Focus state changed: " .. tostring(focused))
end

love.keypressed = function(key)
  logger.debug("Key pressed: " .. key)
  input.press(key)
end

love.keyreleased = function(key)
  logger.debug("Key released: " .. key)
  input.release(key)
end

love.update = function(dt)
  world:update(dt)
end
