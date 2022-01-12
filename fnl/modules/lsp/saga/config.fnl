;; Module for configure Lspsaga 
(local tsv (require :lib.tsukivim))

(let [(ok? saga) (tsv.require-plugin :lspsaga)]
  (if ok?
    (saga.setup)
    :otherwise (tsv.notify.error saga
                                 "modules.lsp.saga.config")))

