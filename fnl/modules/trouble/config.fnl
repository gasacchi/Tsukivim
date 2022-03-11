;; Module for configure Trouble.nvim
(local tsv (require :utils))
  
(let [(ok? trouble) (tsv.require-plugin :trouble)]
  (if ok?
    (trouble.setup 
      {:auto_open true
       :auto_close true
       :auto_preview false
       :auto_jump {}})
    :otherwise (tsv.notify.error trouble
                                 [:module :modules.trouble.config]))) 

