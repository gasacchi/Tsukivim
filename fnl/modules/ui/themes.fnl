;; Module for configure themes
(local 
  {: require-plugin : cmd } (require :lib.tsukivim))

(local {: gui?} (require :modules.ui.gui))
   
(let [(ok? kanagawa) (require-plugin :kanagawa)]
  (when ok?
    (kanagawa.setup 
      {:transparent (not (gui?))}
      (cmd "colorscheme kanagawa"))))

(when (not (gui?))
  (cmd "hi! MsgArea guibg=none guifg=#DCD7BA")
  (cmd "hi! Normal guibg=none guifg=#DCD7BA	"))


