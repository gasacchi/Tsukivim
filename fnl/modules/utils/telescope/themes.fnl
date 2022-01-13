;; Module for configure telescope themes

(local tsv (require :lib.tsukivim))

(fn config [title ?height]
  "Accept title and optional height and return ivy theme table 
  with additional options"
  (let [(ok? themes) (tsv.require-plugin :telescope.themes)]
    (if ok? 
      (themes.get_ivy {:layout_config {:prompt_position :bottom
                                       :height (or ?height 20)}
                       :prompt " ﬦ "
                       :prompt_title title})
      :otherwise (do 
                   (tsv.notify.error 
                     themes
                     [:fn:config :modules.utils.telescope.themes])
                   {}))))

{: config}
