-- Hop configuration module
-- @module hop
-- @field function config
local hop = {}

-- config function
-- run after hop plugin is loaded
hop.config = function()
  require'hop'.setup{
    keys = 'aoeuhtnsmkgpc',
    term_seq_bias = 0.5,
  }
end

return hop
