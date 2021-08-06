-- vim.o.guicursor = ''

-- Encoding
-- The encoding displayed
vim.o.encoding = 'utf-8'
-- The encoding written to file
vim.o.fileencoding = 'utf-8'

-- Auto chdir
vim.o.autochdir = true

-- abandon hidden buffer when unloading
vim.o.hidden = true

-- Fix backspace indent
vim.o.backspace = 'indent,eol,start'

-- Fix split to bottom and right
-- Fix split to bottom and right
vim.o.splitbelow = true
vim.o.splitright = true

-- Set Default shell
vim.o.shell = '/bin/fish'

-- Searching
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Visual

-- Tabs
vim.bo.tabstop = 2
vim.o.tabstop = 2
vim.bo.softtabstop = 0
vim.o.softtabstop = 0
vim.bo.shiftwidth = 2
vim.o.shiftwidth = 2
vim.bo.expandtab = true
vim.o.expandtab = true
vim.bo.swapfile = false
vim.o.swapfile = false

-- Set colorcolumn
vim.wo.colorcolumn = '80'
-- Set relative number
-- wo relativenumber, true
-- wo number, true
-- Visual Settings
vim.wo.cursorline = true
vim.wo.cursorcolumn = true
vim.wo.wrap = false
vim.wo.scrolloff = 8


-- ----------------------------------------------------------------------------
-- Commands
-- ----------------------------------------------------------------------------
vim.cmd'syntax on'
vim.cmd'filetype on'
vim.cmd'filetype plugin indent on'
-- vim.cmd'shortmess+=c'

-- cmd'laststatus=2'
-- cmd'statusline=helo'

-- Jump to file faster
--vim.cmd'noshowmode'
-- vim.cmd'path+=**'

