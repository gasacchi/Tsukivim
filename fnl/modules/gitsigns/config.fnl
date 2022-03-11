;; Module for configure gitsigns

(local tsv (require :utils))

(let [(ok gitsigns) (tsv.require-plugin :gitsigns)]
  (if ok
    (gitsigns.setup {:keymaps {}})
    :otherwise (tsv.notify.error gitsigns 
                                 [:module :modules.gitsigns.config])))
