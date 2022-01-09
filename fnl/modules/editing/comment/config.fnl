;; Module for configure kommentary
(local tsv (require :lib.tsukivim))

(let [(ok? cmt) (tsv.require-plugin :Comment)]
  (if ok?
    (cmt.setup)))

