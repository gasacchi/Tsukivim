;; Module for configure better-escope.nvim
(local tsv (require :lib.tsukivim))

(let [(ok? better-escape) (tsv.require-plugin :better_escape)]
  (if ok?
    (better-escape.setup)))
