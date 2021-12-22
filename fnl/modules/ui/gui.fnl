;; module for configure Neovim gui
(import-macros {: run! : let-global!} :lib.macro.vim)

(local neovide? vim.g.neovide)

(fn config []
    (when neovide?
     (let-global! :neovide_transparency 0.3)
     (run! "set guifont=Iosevka\\ Nerd\\ Font:h9")))
        


{: config 
 :gui? neovide?}
