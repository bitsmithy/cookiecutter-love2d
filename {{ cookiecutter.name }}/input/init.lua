local M = {}

---Setup input options
---@param debug boolean Whether to set up in debug mode
M.setup = function(debug)
  require("input.keyboard").setup(debug)
  require("input.mouse").setup(debug)
end

M.mouse = require("input.mouse")
M.key = require("input.keyboard")

return M
