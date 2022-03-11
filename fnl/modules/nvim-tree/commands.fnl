;; Module contais nvim-tree commands

(local tsv (require :utils))

(fn toggle []
  "Toggle nvim-tree"
  (tsv.cmd :NvimTreeToggle))

(fn refresh []
  "Refresh nvim-tree"
  (tsv.cmd :NvimTreeRefresh))

(fn focus []
  "Focus on nvim-tree window"
  (tsv.cmd :NvimTreeFocus))

{: toggle
 : refresh
 : focus}

