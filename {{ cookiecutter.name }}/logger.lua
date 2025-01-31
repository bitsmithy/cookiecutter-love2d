local M = {}
local socket = require("socket")

---@alias Level "info" | "debug" | "warn"

---@type table<Level, integer>
local LEVEL_PRIORITY = {
  -- Higher means more verbose
  info = 1,
  warn = 2,
  debug = 3,
}

---@type { level: Level }
local config = {
  level = "info",
}

-- Helper function to check if current level is sufficient
---@param level Level
local function isLevelEnabled(level)
  return LEVEL_PRIORITY[config.level] >= LEVEL_PRIORITY[level]
end

---Helper function to print a log message with a timestamp and logging level
---@param level Level
---@param msg string
local function log(level, msg)
  local time = socket.gettime()
  local secs = math.floor(time)
  local msecs = math.floor((time - secs) * 1000000)
  local ts = os.date("%y-%m-%d %H:%M:%S", secs) .. string.format(".%06d", msecs)
  print(ts .. " [" .. string.upper(level) .. "] " .. msg)
end

---Creates a logging function with the specified level
---@param level Level
---@return fun(msg: string | fun(): string)
local function logWithLevel(level)
  ---@param msg string | fun(): string A string or a function that returns a string to be logged
  return function(msg)
    if isLevelEnabled(level) then
      local m

      if type(msg) == "function" then
        m = msg()
      else
        m = msg
      end

      log(level, m)
    end
  end
end

M.debug = logWithLevel("debug")
M.info = logWithLevel("info")
M.warn = logWithLevel("warn")

---Set the logging level
---@param level Level
M.setLevel = function(level)
  config.level = level
end

return M
