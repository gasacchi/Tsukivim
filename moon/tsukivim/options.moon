import set, cmd from require'modules.builtin'

set.o 'guicursor', ''

-- Encoding
-- The encoding displayed
set.o 'encoding', 'utf-8'
-- The encoding written to file
set.o 'fileencoding', 'utf-8'

-- Auto chdir
set.o 'autochdir', true

-- abandon hidden buffer when unloading
set.o 'hidden', true

-- Fix backspace indent
set.o 'backspace', 'indent,eol,start'

-- Fix split to bottom and right
-- Fix split to bottom and right
set.o 'splitbelow', true
set.o 'splitright', true

-- Set Default shell
set.o 'shell', '/bin/fish'

-- Searching
set.o 'hlsearch', true
set.o 'incsearch', true
set.o 'ignorecase', true
set.o 'smartcase', true

-- Visual

-- Tabs
set.bo 'tabstop', 2
set.o 'tabstop', 2
set.bo 'softtabstop', 0
set.o 'softtabstop', 0
set.bo 'shiftwidth', 2
set.o 'shiftwidth', 2
set.bo 'expandtab', true
set.o 'expandtab', true
set.bo 'swapfile', false
set.o 'swapfile', false

-- Set colorcolumn
set.wo 'colorcolumn', '80'
-- Set relative number
-- wo relativenumber, true
-- wo number, true
-- Visual Settings
set.wo 'cursorline', true
set.wo 'cursorcolumn', true
set.wo 'wrap', false
set.wo 'scrolloff', 8


-- ----------------------------------------------------------------------------
-- Commands
-- ----------------------------------------------------------------------------
cmd 'syntax on'
cmd 'filetype on'
cmd 'filetype plugin indent on'
cmd 'set shortmess+=c'

-- cmd 'set laststatus=2'
-- cmd 'set statusline=helo'

-- Jump to file faster
cmd 'set noshowmode'
cmd 'set path+=**'


