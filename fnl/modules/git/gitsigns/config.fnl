;; Module for configure gitsigns

(local tsv (require :lib.tsukivim))

(let [(ok gitsigns) (tsv.require-plugin :gitsigns)]
  (if ok
    (gitsigns.setup {:keymaps {}})
    :otherwise (tsv.notify.error gitsigns 
                                 [:module :modules.git.gitsigns.config])))

