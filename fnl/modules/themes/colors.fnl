;; Module for re-exporting kanagawa default colors
(local tsv (require :utils))

(local colors 
  (let [(ok? kanagawa) (tsv.require-plugin :kanagawa.colors)]
    (if ok?
      (kanagawa.setup)
      :otherwise (tsv.notify.error kanagawa
                                   [:local:colors :modules.themes.colors])))) 

colors
