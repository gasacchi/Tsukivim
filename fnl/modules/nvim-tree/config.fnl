;; Module for configure nvim-tree
(local tsv (require :utils))

(let [(ok? nvim-tree) (tsv.require-plugin :nvim-tree)]
  (if ok?
    (nvim-tree.setup 
      {:view {:side :right}
       :update_cwd true})
    :otherwise (tsv.notify.error nvim-tree
                                 [:module :modules.nvim-tree.config])))

