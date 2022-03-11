(local tsv (require :utils))

;; File encoding
; (set! :encoding :utf-8)
(tsv.set-option :encoding :utf-8)
; (set-buffer! :fileencoding :utf-8)
(tsv.set-option :fileencoding :utf-8)

;; Fix backspace indent
; (set! :backspace "indent,eol,start")
(tsv.set-option :backspace "indent,eol,start")

;; Fix split to bottom & right
(tsv.set-option :splitbelow true)
(tsv.set-option :splitright true)

;; Abandon hidden buffer when unloading
(tsv.set-option :hidden true)

;; Set default shell
(tsv.set-option :shell "/bin/fish")

;; Searching
(tsv.set-option :hlsearch true)
(tsv.set-option :incsearch true)
(tsv.set-option :ignorecase true)
(tsv.set-option :smartcase true)

;; Tabs
(tsv.set-option :tabstop 2)
(tsv.set-option :softtabstop 2)
(tsv.set-option :shiftwidth 2)
(tsv.set-option :expandtab true)

;; No swap file
(tsv.set-option :swapfile false)

;; screen will not be redraw while executing macros,register, and other command 
(tsv.set-option :lazyredraw true)

;; disable shada
(tsv.set-option :shadafile "NONE")
(tsv.cmd "set shada=\"NONE\"")

;; Set colorcolumn
(tsv.set-option :colorcolumn :80)

;; Cursor settings 
(tsv.set-option :cursorline true)
(tsv.set-option :cursorcolumn true)

;; No wraping text
(tsv.set-option :wrap false)
(tsv.set-option :scrolloff 999)
;; termguicolors
(tsv.set-option :termguicolors true)

;; hide builtin mode text
(tsv.set-option :showmode false)

;; Enable filetype and syntax
(tsv.cmd "filetype plugin indent on")
(tsv.cmd "syntax enable")


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
