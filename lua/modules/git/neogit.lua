-- Neogit configuration module
-- @module neogit
-- @field function config
local neogit = 
  {}

-- config function
-- run after neogit plugin is loaded
neogit.config = function()
  require'neogit'.setup{}
end

return neogit
