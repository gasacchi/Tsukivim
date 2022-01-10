;; Module for configure neogit
(local tsv (require :lib.tsukivim))

(let [(ok? neogit) (tsv.require-plugin :neogit)]
  (if ok?
    (neogit.setup)
    :otherwise (tsv.notify.error "Cannot load neogit.nvim"
                                 "Plugin: neogit.nvim")))

