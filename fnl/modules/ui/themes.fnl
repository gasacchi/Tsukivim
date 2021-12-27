;; Module for configure themes
(local 
  {: require-plugin : cmd : let-global} (require :lib.tsukivim))

(let [(ok? _) (require-plugin :tokyonight)
      {: gui? } (require :modules.ui.gui)]
  (when ok?
     (let-global :tokyonight_style :storm)
     (let-global :tokyonight_transparent (not (gui?)))
     (let-global :tokyonight_sidebars [:qf :vista_kind :terminal :nvim-tree :packer])
     (cmd "colorscheme tokyonight")))

