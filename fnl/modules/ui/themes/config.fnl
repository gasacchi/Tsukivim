;; Module for configure themes
(local tsv (require :lib.tsukivim))

(local {: gui?} (require :modules.ui.themes.gui))
   
(let [(ok? kanagawa) (tsv.require-plugin :kanagawa)]
  (if ok?
    (kanagawa.setup 
      {:transparent (not (gui?))}
      (tsv.cmd "colorscheme kanagawa"))
    :otherwise (tsv.notify "Cannot load kanagawa.nvim"
                           "Plugin: kanagawa.nvim")))

(when (not (gui?))
  (tsv.cmd "hi! MsgArea guibg=none guifg=#DCD7BA")
  (tsv.cmd "hi! Normal guibg=none guifg=#DCD7BA	"))


