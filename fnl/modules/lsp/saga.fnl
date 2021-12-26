;; Module for configure Lspsaga 
(local {: require-plugin} (require :lib.tsukivim))

(let [(ok? saga) (require-plugin :lspsaga)]
  (when ok?
    (saga.setup)))

