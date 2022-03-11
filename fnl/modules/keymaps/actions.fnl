;; modules for eval Actions keymaps
(local eval-cmd (require :modules.commands.eval))

{:normal 
 {:name :Actions
  " " [:<Esc>                           :Close]
  :p  ["\"+p"                           :Paste-from-clipboard]
  :e  [eval-cmd.current-file            :Eval-current-file]
  :s  [eval-cmd.source                  :Source-current-file]}
 :visual 
 {:name :Actions
  :y  ["\"+y"                           :Yank-to-clipboard]}}

