import cmd, let from require'modules.builtin'

-- true color support
cmd "set termguicolors"

let 'sonokai_style', 'andromeda'
let 'sonokai_enable_italic', 1
let 'sonokai_transparent_background', 1
let 'sonokai_better_performance', 1

cmd 'colorscheme sonokai'

-- Overide sonokai colorscheme

-- Basic
cmd"hi CursorLine guibg=#1B0E1B"
cmd"hi CursorColumn guibg=#1B0E1B"
cmd"hi ColorColumn guibg=#1B0E1B"
cmd"hi VertSplit guifg=#1B0E1B"
cmd"hi StatusLine guibg=#0D070D"
cmd"hi PMenu guibg=#1B0E1B"
cmd"hi PMenuSel guibg=#A253BD"
cmd"hi PMenuSbar guibg=#A253BD"
cmd"hi PMenuThumb guibg=#1B0E1B" 

-- Coc
cmd"hi CocHintFloat guifg=#CCFA9D guibg=#1B0E1B" 
cmd"hi CocInfoFloat guifg=#6E98D3 guibg=#1B0E1B" 
cmd"hi CocWarningFloat guifg=#FEEF9A guibg=#1B0E1B" 
cmd"hi CocErrorFloat guifg=#FF334E guibg=#1B0E1B" 
cmd"hi CocFloating guibg=#1B0E1B" 

-- Telescope
cmd "hi TelescopeSelection      guifg=#FA9D9D gui=bold" --selected item
cmd "hi TelescopeSelectionCaret guifg=#FACC9D" -- selection caret
cmd "hi TelescopeMultiSelection guifg=#CCFA9D" --multisections
cmd "hi TelescopeNormal         guifg=#FB9EF8 guibg=#00000" --floating windows created by telescope.
 -- Border hi groups.
cmd "hi TelescopeBorder         guifg=#1B0E1B"
cmd "hi TelescopePromptBorder   guifg=#1B0E1B"
cmd "hi TelescopeResultsBorder  guifg=#1B0E1B"
cmd "hi TelescopePreviewBorder  guifg=#1B0E1B"
-- Used for highlighting characters that you match.
cmd "hi TelescopeMatching       guibg=#A253BD guifg=#0D070D"
-- Used for the prompt prefix
cmd "hi TelescopePromptPrefix   guifg=#FACC9D"




