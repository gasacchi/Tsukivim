-- ----------------------------------------------------------------------------
-- UI
-- ----------------------------------------------------------------------------
import cmd,g,o from vim

require "lualine"
require "bufferline"

-- true color support
cmd "set termguicolors"

-- cmd("highlight Normal guibg=NONE ctermbg=NONE")

g.sonokai_style = "andromeda"                                                                                                             
g.sonokai_enable_italic = 1
cmd "colo sonokai"

lualine_setup =
  options:
    theme: "nightfly",
    section_separators: { "", "" }
    component_separators: { "::", "::" }

bufferline_setup =
  options:
    separator_style: "slant"


require"lualine".setup lualine_setup
require"bufferline".setup bufferline_setup

return

-- ----------------------------------------------------------------------------
-- EOF
-- ----------------------------------------------------------------------------
