import cmd,g,o from vim

require "lualine"
require "bufferline"

-- true color support
cmd "set termguicolors"


g.sonokai_style = "andromeda"                                                                                                             
g.sonokai_enable_italic = 1
g.sonokai_transparent_background = 1
cmd "colo sonokai"

lualine_setup =
  options:
    theme: "nightfly",
    section_separators: { "", "  " }
    component_separators: { "::", "::" }

bufferline_setup =
  options:
    separator_style: "slant"
    view: "multiwindow"

-- cmd("highlight Normal guibg=NONE ctermbg=NONE")
cmd("highlight ColorColumn guibg=#1B0E1B ctermbg=NONE")
cmd("highlight CursorColumn guibg=#1B0E1B ctermbg=NONE")
cmd("highlight CursorLine guibg=#1B0E1B ctermbg=NONE")

require"lualine".setup lualine_setup
require"bufferline".setup bufferline_setup
