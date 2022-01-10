;; Module for configure toggleterm.nvim

(local tsv (require :lib.tsukivim))

(let 
  [(ok? toggleterm) (tsv.require-plugin :toggleterm)]
  (if ok?
    (toggleterm.setup)
    :otherwise (tsv.notify.error "Cannot load toggleterm.nvim"
                                 "Plugin: toggleterm.nvim")))
