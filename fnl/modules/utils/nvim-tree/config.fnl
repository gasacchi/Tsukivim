;; Module for configure nvim-tree
(local tsv (require :lib.tsukivim))

(let [(ok? nvim-tree) (tsv.require-plugin :nvim-tree)]
  (if ok?
    (nvim-tree.setup 
      {:view {:side :right}
       :update_cwd true})
    :otherwise (tsv.notify.error "Cannot load nvim-tree.nvim"
                                 "Plugin: nvim-tree.nvim")))
