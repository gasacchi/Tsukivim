;; Module for configure themes
(import-macros {: run! : let-global!} :lib/macro/vim)

(local {: plugin-exist?} (require :lib.tsukivim))

(fn setup [] 
  "Function that run before tokyonight.nvim loaded"
  ;; see: ./gui.fnl
  (let [{: gui? :config gui-config} (require :modules.ui.gui)]
     (gui-config)

    ;; Set tokyonight configuration
     (let-global! :tokyonight_style :storm)
     (let-global! :tokyonight_transparent (not gui?))
     (let-global! :tokyonight_sidebars [:qf :vista_kind :terminal :nvim-tree :packer])))
    


(fn config []
  "Function that run after tokyonight.nvim loaded"

  (when (plugin-exist? :tokyonight.nvim)
     ;; Set colorscheme to tokyonight
     (run! "colorscheme tokyonight")))

{: config
 : setup}
