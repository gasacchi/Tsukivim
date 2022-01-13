;; Module for configure hop.nvim

(local tsv (require :lib.tsukivim))

(let [(ok? hop) (tsv.require-plugin :hop)]
  (if ok?
    (hop.setup 
      {:keys "aoeuidhtns" ;; Only use this key for jumping
       :quit_key :q ;; quit hop mode with `q`
       :multi_windows true})
    :otherwise (tsv.notify.error hop 
                                 [:module :modules.editing.hop.config]))) 

