;; module for configure Neovim gui
(import-macros {: run!} :lib.macro.vim)

(local goneovim? vim.g.gonvim_running)

(fn config []
    (when goneovim?
        (print "Running on Gui")))


{: config 
 :gui? goneovim?}
