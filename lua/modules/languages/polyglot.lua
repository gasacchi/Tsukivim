--- Module polyglot language syntax.
-- @module polyglot
-- @field setup
local polyglot = {}

--- Setup function.
-- run before polyglot.vim plugin is loaded
polyglot.setup = function()
  vim.g.polyglot_disable = {}
end

return polyglot
