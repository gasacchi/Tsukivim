;; Module for configure nvim-tree
(local {: plugin-exist?} (require :lib.tsukivim))

(local nvim-tree-config 
  {:view {:side :right}
   :update_cwd true})

(fn config []
  "Function that run after nvim-tree is loaded"
  (when (plugin-exist? :nvim-tree.lua)
     (let [nvim-tree (require :nvim-tree)]
        (nvim-tree.setup nvim-tree-config))))

{: config}
