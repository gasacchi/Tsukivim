;; Module for configure better-escope.nvim
(local tsv (require :lib.tsukivim))

(let [(ok? better-escape) (tsv.require-plugin :better_escape)]
  (if ok?
    (better-escape.setup)
    :otherwise (tsv.notify.error "Cannot load better-escape.nvim" 
                                 "Plugin: better-escape.nvim")))
