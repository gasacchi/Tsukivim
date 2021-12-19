(import-macros 
	{: set! : set-buffer! : set-window! : run!}
	:lib.macro.vim)

;; File encoding
(set! :encoding :utf-8)
(set-buffer! :fileencoding :utf-8)

;; Fix backspace indent
(set! :backspace "indent,eol,start")

;; Fix split to bottom & right
(set! :splitbelow true)
(set! :splitright true)

;; Abandon hidden buffer when unloading
(set! :hidden true)

;; Set default shell
(set! :shell "/bin/fish")

;; Searching
(set! :hlsearch true)
(set! :incsearch true)
(set! :ignorecase true)
(set! :smartcase true)

;; Tabs
(set! :tabstop 2)
(set! :softtabstop 2)
(set! :shiftwidth 2)
(set! :expandtab true)

;; No swap file
(set! :swapfile false)

;; Set colorcolumn
(set-window! :colorcolumn :80)

;; Cursor settings 
(set-window! :cursorline true)
(set-window! :cursorcolumn true)

;; No wraping text
(set-window! :wrap false)
(set-window! :scrolloff 999)

;; Enable filetype and syntax
(run! "filetype plugin indent on")
(run! "syntax enable")
