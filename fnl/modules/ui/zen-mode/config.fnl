;; Module for configure zen-mode.nvim

(local tsv (require :lib.tsukivim))

(let [(ok? zen-mode) (tsv.require-plugin :zen-mode)]
  (if ok?
    (zen-mode.setup)
    :otherwise (tsv.notify.error zen-mode
                                 "modules.ui.zen-mode.config")))

