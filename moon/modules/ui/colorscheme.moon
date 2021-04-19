import cmd, let from require'modules.builtin'

-- true color support
cmd "set termguicolors"

let 'sonokai_style', 'andromeda'
let 'sonokai_enable_italic', 1
let 'sonokai_transparent_background', 1
let 'sonokai_better_performance', 1

cmd 'colorscheme sonokai'

-- Overide sonokai colorscheme

cmd"hi CursorLine guibg=#1B0E1B"
cmd"hi CursorColumn guibg=#1B0E1B"
cmd"hi ColorColumn guibg=#1B0E1B"
cmd"hi VertSplit guifg=#1B0E1B"



