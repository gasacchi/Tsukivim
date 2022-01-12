;; Module for re-exporting kanagawa default colors
(local tsv (require :lib.tsukivim))

(local colors 
  (let [(ok? kanagawa) (tsv.require-plugin :kanagawa.colors)]
    (if ok?
      (kanagawa.setup)
      :otherwise (tsv.notify.error kanagawa
                                   "modules.ui.themes.colors: local colors")))) 

colors
