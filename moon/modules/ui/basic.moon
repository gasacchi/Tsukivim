import cmd, let from require'modules.builtin'


-- true color support
cmd "set termguicolors"


let 'sonokai_style', "andromeda"                                                                                                             
let 'sonokai_enable_italic', 1
let 'sonokai_transparent_background', 1
cmd "colo sonokai"

bufferline_setup =
  options:
    separator_style: "slant"
    view: "multiwindow"

-- cmd("highlight Normal guibg=NONE ctermbg=NONE")
cmd "highlight ColorColumn guibg=#1B0E1B ctermbg=NONE"
cmd "highlight CursorColumn guibg=#1B0E1B ctermbg=NONE"
cmd "highlight CursorLine guibg=#1B0E1B ctermbg=NONE"

require"bufferline".setup bufferline_setup
