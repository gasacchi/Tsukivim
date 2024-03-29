;; Module for configure themes
(local tsv (require :utils))

(local {: gui?} (require :modules.themes.gui))
   
(let [(ok? kanagawa) (tsv.require-plugin :kanagawa)]
  (if ok?
    (do (kanagawa.setup 
          {:transparent (not (gui?))})
        (tsv.cmd "colorscheme kanagawa"))
    :otherwise (tsv.notify.error kanagawa
                                 [:module :modules.themes.config])))

(when (not (gui?))
  (tsv.cmd "hi! MsgArea guibg=none guifg=#DCD7BA")
  (tsv.cmd "hi! Normal guibg=none guifg=#DCD7BA	"))
