;; Module for configure kommentary
(local tsv (require :utils))

(let [(ok? cmt) (tsv.require-plugin :Comment)
      (ok-ft? ft) (tsv.require-plugin :Comment.ft)]
  (if (and ok? ok-ft?)
    (do 
      (cmt.setup)
      (ft.set :fennel ";;%s"))
    :otherwise (tsv.notify.error cmt
                                 [:module :modules.comment.config])))

