import o,bo,wo,cmd from vim

o.guicursor = ''

-- Encoding
-- The encoding displayed
o.encoding = 'utf-8'
-- The encoding written to file
o.fileencoding = 'utf-8'

-- Auto chdir
o.autochdir = true

-- abandon hidden buffer when unloading
o.hidden = true

-- Fix backspace indent
o.backspace = 'indent,eol,start'

-- Fix split to bottom and right
-- Fix split to bottom and right
o.splitbelow = true
o.splitright = true

-- Set Default shell
o.shell='/bin/zsh'

-- Searching
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- Visual
cmd('set noshowmode')

-- Tabs
bo.tabstop = 2
o.tabstop = 2
bo.softtabstop = 0
o.softtabstop = 0
bo.shiftwidth = 2
o.shiftwidth = 2
bo.expandtab = true
o.expandtab = true
bo.swapfile = false
o.swapfile = false

-- Set colorcolumn
wo.colorcolumn = '80'
-- Set relative number
-- wo.relativenumber = true
-- wo.number = true
-- Visual Settings
wo.cursorline = true
wo.cursorcolumn = true
wo.wrap = false
wo.scrolloff = 8


-- ----------------------------------------------------------------------------
-- Commands
-- ----------------------------------------------------------------------------
cmd 'syntax on'
cmd 'filetype on'
cmd 'filetype plugin indent on'
cmd 'set shortmess+=c'

-- Jump to file faster
cmd ':set path+=**'

return
