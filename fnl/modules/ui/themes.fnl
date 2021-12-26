;; Module for configure themes
(import-macros {: run! : let-global!} :lib/macro/vim)

(local {: require-plugin} (require :lib.tsukivim))

(let [(ok? _) (require-plugin :tokyonight)
      {: gui? :config gui-config} (require :modules.ui.gui)]
  (when ok?
     (gui-config)
     (let-global! :tokyonight_style :storm)
     (let-global! :tokyonight_transparent (not gui?))
     (let-global! :tokyonight_sidebars [:qf :vista_kind :terminal :nvim-tree :packer])
     (run! "colorscheme tokyonight")))

