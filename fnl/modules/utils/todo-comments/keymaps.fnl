;; Module contains todo-comments keymaps

(local todo-comments-cmd (require :modules.utils.todo-comments.commands))

{:normal 
 {:name :Trouble
  " " [:<Esc>                           :Close]
  :t  [todo-comments-cmd.trouble-toggle :Todo-Trouble-toggle]}}
