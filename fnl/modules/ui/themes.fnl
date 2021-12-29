;; Module for configure themes
(local 
  {: require-plugin : cmd } (require :lib.tsukivim))

(let [(ok? kanagawa) (require-plugin :kanagawa)
      {: gui?} (require :modules.ui.gui)]
  (when ok?
    (kanagawa.setup 
      {:transparent (not (gui?))}
      (cmd "colorscheme kanagawa"))))



