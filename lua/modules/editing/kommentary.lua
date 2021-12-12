-- Kommentary configuration module
-- @field function config
local kommentary = {}

-- config function
-- run after kommentary plugin is loaded
kommentary.config = function()
  require'kommentary.config'.configure_language("purescript", {
    single_line_comment_string = "-- |",
    multi_line_comment_strings = {"{-", "-}"},
    prefer_single_line_comments = true,
  })
end

return kommentary
