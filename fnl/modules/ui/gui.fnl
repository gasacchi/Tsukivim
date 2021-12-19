;; module for configure Neovim gui
(import-macros {: run!} :lib.macro.vim)

(local nvui? vim.g.nvui)
(local goneovim? vim.g.gonvim_running)

(fn config []
    (when nvui?
        (run! "set guifont=Iosevka\\ Nerd\\ Font:h12")
        (run! "NvuiOpacity 0.8")))


{: config 
 :gui? (or nvui? goneovim?)}
