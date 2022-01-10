;; Module for configure themes
(local tsv (require :lib.tsukivim))

(local {: gui?} (require :modules.ui.gui))
   
(let [(ok? kanagawa) (tsv.require-plugin :kanagawa)]
  (if ok?
    (kanagawa.setup 
      {:transparent (not (gui?))}
      (cmd "colorscheme kanagawa"))
    :otherwise (tsv.notify "Cannot load kanagawa.nvim"
                           "Plugin: kanagawa.nvim")))

(when (not (gui?))
  (cmd "hi! MsgArea guibg=none guifg=#DCD7BA")
  (cmd "hi! Normal guibg=none guifg=#DCD7BA	"))


