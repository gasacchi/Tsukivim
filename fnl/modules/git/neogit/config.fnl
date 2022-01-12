;; Module for configure neogit
(local tsv (require :lib.tsukivim))

(let [(ok? neogit) (tsv.require-plugin :neogit)]
  (if ok?
    (neogit.setup)
    :otherwise (tsv.notify.error neogit "modules.git.neogit.config")))


