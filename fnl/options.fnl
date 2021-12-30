(local 
  {: set-option : cmd} (require :lib.tsukivim))

;; File encoding
; (set! :encoding :utf-8)
(set-option :encoding :utf-8)
; (set-buffer! :fileencoding :utf-8)
(set-option :fileencoding :utf-8)

;; Fix backspace indent
; (set! :backspace "indent,eol,start")
(set-option :backspace "indent,eol,start")

;; Fix split to bottom & right
(set-option :splitbelow true)
(set-option :splitright true)

;; Abandon hidden buffer when unloading
(set-option :hidden true)

;; Set default shell
(set-option :shell "/bin/bash")

;; Searching
(set-option :hlsearch true)
(set-option :incsearch true)
(set-option :ignorecase true)
(set-option :smartcase true)

;; Tabs
(set-option :tabstop 2)
(set-option :softtabstop 2)
(set-option :shiftwidth 2)
(set-option :expandtab true)

;; No swap file
(set-option :swapfile false)

;; screen will not be redraw while executing macros,register, and other command 
(set-option :lazyredraw true)

;; disable shada
(set-option :shadafile "NONE")
(cmd "set shada=\"NONE\"")

;; Set colorcolumn
(set-option :colorcolumn :80)

;; Cursor settings 
(set-option :cursorline true)
(set-option :cursorcolumn true)

;; No wraping text
(set-option :wrap false)
(set-option :scrolloff 999)
;; termguicolors
(set-option :termguicolors true)

;; hide builtin mode text
(set-option :showmode false)

;; Enable filetype and syntax
(cmd "filetype plugin indent on")
(cmd "syntax enable")


;; disable builtin plugins
(local builtin 
  ["2html_plugin"
   "getscript"
   "getscriptPlugin"
   "gzip"
   "logipat"
   "netrw"
   "netrwPlugin"
   "netrwSettings"
   "netrwFileHandlers"
   "matchit"
   "tar"
   "tarPlugin"
   "rrhelper"
   "spellfile_plugin"
   "vimball"
   "vimballPlugin"
   "zip"
   "zipPlugin"])

(each [_ plugin (pairs builtin)]
  (tset vim.g (.. :loaded_ plugin) 1))

