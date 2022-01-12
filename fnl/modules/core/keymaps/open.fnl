;; Module contains open commands

(local glow-cmd (require :modules.utils.glow.commands))
(local nvim-tree-cmd (require :modules.utils.nvim-tree.commands))
(local terminal-cmd (require :modules.utils.toggleterm.commands))

{:normal 
 {:name :Open
  " "   [:<Esc>                           :Close]
  :e    [nvim-tree-cmd.toggle             :Toggle-file-explorer]
  :E    [nvim-tree-cmd.focus              :Focus-on-file-explorer]
  :m    [glow-cmd.toggle                  :Toggle-markdown-previewer]
  :t    [terminal-cmd.toggle              :Toggle-terminal]
  :T    [terminal-cmd.toggle-all          :Toggle-terminal]}}

