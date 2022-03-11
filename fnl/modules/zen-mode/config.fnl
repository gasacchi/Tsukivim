;; Module for configure zen-mode.nvim

(local tsv (require :utils))

(let [(ok? zen-mode) (tsv.require-plugin :zen-mode)]
  (if ok?
    (zen-mode.setup)
    :otherwise (tsv.notify.error zen-mode
                                 [:module :modules.zen-mode.config])))

