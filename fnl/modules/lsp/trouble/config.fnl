;; Module for configure Trouble.nvim
(local tsv (require :lib.tsukivim))
  
(let [(ok? trouble) (tsv.require-plugin :trouble)]
  (if ok?
    (trouble.setup)
    :otherwise (tsv.notify.error "Cannot load trouble.nvim"
                                 "Plugin: trouble.nvim"))) 
