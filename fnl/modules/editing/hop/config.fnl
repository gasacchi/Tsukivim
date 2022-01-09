;; Module for configure hop.nvim

(local tsv (require :lib.tsukivim))

(let [(ok? hop) (tsv.require-plugin :hop)]
  (if ok?
    (hop.setup 
      {:keys "aoeuidhtns" ;; Only use this key for jumping
       :quit_key :q
       :multi_windows true}))) ;; use "q" to quit hop mode

