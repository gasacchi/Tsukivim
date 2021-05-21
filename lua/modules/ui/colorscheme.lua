
-- vim.cmd 'let &termguicolors = !empty("$NVIM_TUI_ENABLE_TRUE_COLOR")'
-- vim.cmd [[let &t_8f = "\e[38;2;%lu;%lu;%lum"]]
-- vim.cmd [[let &t_8b = "\e[48;2;%lu;%lu;%lum"]]

vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_transparent_background = 1
vim.g.sonokai_better_performance = 1

vim.cmd 'colorscheme sonokai'


-- Overide sonokai colorscheme

-- Basic ----------------------------------------------------------------------
vim.cmd'hi! Normal guifg=#FCCCF5'
vim.cmd'hi! Comment guifg=#AD9DFA'
vim.cmd'hi! String guifg=#A253BD'
vim.cmd'hi! Visual guibg=#FB9EF8'
vim.cmd'hi! TODO guifg=#FACC9D gui=bold'
vim.cmd'hi! TabLineSel guibg=#A253BD'
vim.cmd'hi! CursorLine guibg=#1B0E1B'
vim.cmd'hi! CursorColumn guibg=#1B0E1B'
vim.cmd'hi! ColorColumn guibg=#1B0E1B'
vim.cmd'hi! VertSplit guifg=#1B0E1B'
vim.cmd'hi! StatusLine guibg=#1B0E1B'
vim.cmd'hi! StatusLineNC guibg=#1B0E1B'
vim.cmd'hi! PMenu guifg=#FB9EF8 guibg=#1B0E1B'
vim.cmd'hi! PMenuSel guibg=#A253BD'
vim.cmd'hi! PMenuThumb guibg=#A253BD'
vim.cmd'hi! PMenuSbar guibg=#1B0E1B'
vim.cmd'hi! HintFloat guifg=#CCFA9D guibg=#1B0E1B'
vim.cmd'hi! InfoFloat guifg=#6E98D3 guibg=#1B0E1B'
vim.cmd'hi! WarningFloat guifg=#FEEF9A guibg=#1B0E1B'
vim.cmd'hi! ErrorFloat guifg=#FF334E guibg=#1B0E1B'
vim.cmd'hi! NormalFloat guibg=#1B0E1B'
-------------------------------------------------------------------------------

-- GitSingns ------------------------------------------------------------------
vim.cmd'hi GitSignsAdd guifg=#CCFA9D'
vim.cmd'hi GitSignsChange guifg=#AD9DFA' 
vim.cmd'hi GitSignsRemove guifg=#FA9D9D' 
vim.cmd'hi GitSignsChangeDelete guifg=#A253BD' 
-------------------------------------------------------------------------------

-- Dashboard ------------------------------------------------------------------
vim.cmd'hi DashboardFooter guifg=#CCFA9D' 
vim.cmd'hi DashboardCenter guifg=#FACC9D' 
vim.cmd'hi DashboardShortCut guifg=#FA9D9D' 
-- handled by lolcat
-- vim.cmd'hi DashboardHeader guifg=#CCFA9D' 
-------------------------------------------------------------------------------

-- Coc ------------------------------------------------------------------------
--vim.cmd'hi CocHintFloat guifg=#CCFA9D guibg=#1B0E1B' 
--vim.cmd'hi CocInfoFloat guifg=#6E98D3 guibg=#1B0E1B' 
--vim.cmd'hi CocWarningFloat guifg=#FEEF9A guibg=#1B0E1B' 
--vim.cmd'hi CocErrorFloat guifg=#FF334E guibg=#1B0E1B' 
--vim.cmd'hi CocFloating guibg=#1B0E1B' 
-------------------------------------------------------------------------------

-- Telescope ------------------------------------------------------------------
vim.cmd'hi TelescopeSelection      guifg=#FA9D9D gui=bold' --selected item
vim.cmd'hi TelescopeSelectionCaret guifg=#FACC9D' -- selection caret
vim.cmd'hi TelescopeMultiSelection guifg=#CCFA9D' --multisections
vim.cmd'hi TelescopeNormal         guifg=#FB9EF8 guibg=#00000' -- floating windows created by telescope.
 -- Border hi groups.
vim.cmd'hi TelescopeBorder         guifg=#1B0E1B'
vim.cmd'hi TelescopePromptBorder   guifg=#1B0E1B'
vim.cmd'hi TelescopeResultsBorder  guifg=#1B0E1B'
vim.cmd'hi TelescopePreviewBorder  guifg=#1B0E1B'
-- Used for highlighting characters that you match.
vim.cmd'hi TelescopeMatching       guibg=#A253BD guifg=#0D070D'
-- Used for the prompt prefix
vim.cmd'hi TelescopePromptPrefix   guifg=#FACC9D'

vim.cmd 'set termguicolors'
