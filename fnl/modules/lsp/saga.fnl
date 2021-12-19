;; Module for configure Lspsaga 
(local {: plugin-exist?} (require :lib.tsukivim))
(fn config []
  "Function that run after lspsaga is loaded"
  (when (plugin-exist? :lspsaga.nvim)
   (let [saga (require :lspsaga)]
    (saga.setup))))

{: config}

