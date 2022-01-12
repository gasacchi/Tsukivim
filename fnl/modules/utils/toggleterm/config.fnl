;; Module for configure toggleterm.nvim

(local tsv (require :lib.tsukivim))

(let 
  [(ok? toggleterm) (tsv.require-plugin :toggleterm)]
  (if ok?
    (toggleterm.setup)
    :otherwise (tsv.notify.error toggleterm
                                 "modules.utils.toggleterm.config")))
