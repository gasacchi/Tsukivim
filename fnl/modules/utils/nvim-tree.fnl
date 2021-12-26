;; Module for configure nvim-tree
(local {: require-plugin} (require :lib.tsukivim))

(let [(ok? nvim-tree) (require-plugin :nvim-tree)]
  (when ok?
    (nvim-tree.setup 
      {:view {:side :right}
       :update_cwd true})))

