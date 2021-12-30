;; Module for re-exporting kanagawa default colors
(local {: require-plugin} (require :lib.tsukivim))

(local colors 
  (let [(ok? kanagawa) (require-plugin :kanagawa.colors)]
    (when ok?
      (kanagawa.setup)))) 

colors
