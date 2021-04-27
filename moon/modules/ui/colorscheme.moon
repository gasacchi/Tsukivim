import cmd, let from require'modules.builtin'

-- true color support
cmd "set termguicolors"

let 'sonokai_style', 'andromeda'
let 'sonokai_enable_italic', 1
let 'sonokai_transparent_background', 1
let 'sonokai_better_performance', 1

cmd 'colorscheme sonokai'

-- Overide sonokai colorscheme

-- Basic ----------------------------------------------------------------------
cmd"hi! Normal guifg=#FCCCF5"
cmd"hi! Comment guifg=#AD9DFA"
cmd"hi! String guifg=#A253BD"
cmd"hi! Visual guibg=#FB9EF8"
cmd"hi! TODO guifg=#FACC9D gui=bold"
cmd"hi! TabLineSel guibg=#A253BD"
cmd"hi! CursorLine guibg=#1B0E1B"
cmd"hi! CursorColumn guibg=#1B0E1B"
cmd"hi! ColorColumn guibg=#1B0E1B"
cmd"hi! VertSplit guifg=#1B0E1B"
cmd"hi! StatusLine guibg=#1B0E1B"
cmd"hi! StatusLineNC guibg=#1B0E1B"
cmd"hi! PMenu guifg=#FB9EF8 guibg=#1B0E1B"
cmd"hi! PMenuSel guibg=#A253BD"
cmd"hi! PMenuThumb guibg=#A253BD"
cmd"hi! PMenuSbar guibg=#1B0E1B" 
cmd"hi! HintFloat guifg=#CCFA9D guibg=#1B0E1B" 
cmd"hi! InfoFloat guifg=#6E98D3 guibg=#1B0E1B" 
cmd"hi! WarningFloat guifg=#FEEF9A guibg=#1B0E1B" 
cmd"hi! ErrorFloat guifg=#FF334E guibg=#1B0E1B" 
cmd"hi! NormalFloat guibg=#1B0E1B" 
-------------------------------------------------------------------------------

-- GitSingns ------------------------------------------------------------------
cmd"hi GitSignsAdd guifg=#CCFA9D" 
cmd"hi GitSignsChange guifg=#AD9DFA" 
cmd"hi GitSignsRemove guifg=#FA9D9D" 
cmd"hi GitSignsChangeDelete guifg=#A253BD" 
-------------------------------------------------------------------------------

-- Dashboard ------------------------------------------------------------------
cmd"hi DashboardFooter guifg=#CCFA9D" 
cmd"hi DashboardCenter guifg=#FACC9D" 
cmd"hi DashboardShortCut guifg=#FA9D9D" 
-- handled by lolcat
-- cmd"hi DashboardHeader guifg=#CCFA9D" 
-------------------------------------------------------------------------------

-- Coc ------------------------------------------------------------------------
--cmd"hi CocHintFloat guifg=#CCFA9D guibg=#1B0E1B" 
--cmd"hi CocInfoFloat guifg=#6E98D3 guibg=#1B0E1B" 
--cmd"hi CocWarningFloat guifg=#FEEF9A guibg=#1B0E1B" 
--cmd"hi CocErrorFloat guifg=#FF334E guibg=#1B0E1B" 
--cmd"hi CocFloating guibg=#1B0E1B" 
-------------------------------------------------------------------------------

-- Telescope ------------------------------------------------------------------
cmd"hi TelescopeSelection      guifg=#FA9D9D gui=bold" --selected item
cmd"hi TelescopeSelectionCaret guifg=#FACC9D" -- selection caret
cmd"hi TelescopeMultiSelection guifg=#CCFA9D" --multisections
cmd"hi TelescopeNormal         guifg=#FB9EF8 guibg=#00000" -- floating windows created by telescope.
 -- Border hi groups.
cmd"hi TelescopeBorder         guifg=#1B0E1B"
cmd"hi TelescopePromptBorder   guifg=#1B0E1B"
cmd"hi TelescopeResultsBorder  guifg=#1B0E1B"
cmd"hi TelescopePreviewBorder  guifg=#1B0E1B"
-- Used for highlighting characters that you match.
cmd"hi TelescopeMatching       guibg=#A253BD guifg=#0D070D"
-- Used for the prompt prefix
cmd"hi TelescopePromptPrefix   guifg=#FACC9D"
-------------------------------------------------------------------------------

