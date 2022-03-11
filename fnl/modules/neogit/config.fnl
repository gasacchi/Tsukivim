;; Module for configure neogit
(local tsv (require :utils))

(let [(ok? neogit) (tsv.require-plugin :neogit)]
  (if ok?
    (neogit.setup)
    :otherwise (tsv.notify.error neogit 
                                 [:module :modules.neogit.config])))

