;; Module for configure nvim-tree
(local {: plugin-exist?} (require :lib.tsukivim))

(fn config []
  "Function that run after nvim-tree is loaded"
  (when (plugin-exist? :nvim-tree.lua)
     (let [nvim-tree (require :nvim-tree)]
        (nvim-tree.setup))))

{: config}
