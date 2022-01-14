;; Modules contains actions keymaps

(local eval-cmd (require :modules.core.commands.eval))

{:normal 
 {:name :Actions
  " " [:<Esc>                           :Close]
  :p  ["\"+p"                           :Paste-from-clipboard]
  :e  [eval-cmd.current-file            :Eval-current-file]
  :s  [eval-cmd.source                  :Source-current-file]}
 :visual 
 {:name :Actions
  :y  ["\"+y"                           :Yank-to-clipboard]}}

