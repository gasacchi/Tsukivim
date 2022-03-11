;; Module contains open commands

(local glow-cmd (require :modules.glow.commands))
(local nvim-tree-cmd (require :modules.nvim-tree.commands))

{:normal 
 {:name :Open
  " "   [:<Esc>                           :Close]
  :e    [nvim-tree-cmd.toggle             :Toggle-file-explorer]
  :E    [nvim-tree-cmd.focus              :Focus-on-file-explorer]
  :m    [glow-cmd.toggle                  :Toggle-markdown-previewer]}}

