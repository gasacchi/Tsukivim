;; Module for configure better-escape.nvim
(local tsv (require :utils))

(let [(ok? better-escape) (tsv.require-plugin :better_escape)]
  (if ok?
    (better-escape.setup)
    :otherwise (tsv.notify.error 
                 better-escape
                 [:module :modules.better-escape.config])))

