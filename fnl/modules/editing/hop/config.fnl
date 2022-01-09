;; Module for configure hop.nvim

(local lib (require :lib.tsukivim))

(let [(ok? hop) (lib.require-plugin :hop)]
  (if ok?
    (hop.setup 
      {:keys "aoeuidhtns" ;; Only use this key for jumping
       :quit_key :q
       :multi_windows true}))) ;; use "q" to quit hop mode

(local hop (require :hop))

