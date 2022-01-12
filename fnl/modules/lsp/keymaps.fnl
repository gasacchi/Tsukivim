;; Module contains lsp-config keymaps

(local lsp-cmd (require :modules.lsp.commands))

{:normal 
 {:name :LSP
  " "  [:<Esc> :Close]
  :s   [lsp-cmd.start    :Start-LSP]
  :S   [lsp-cmd.stop     :Stop-LSP]
  :R   [lsp-cmd.restart  :Restart-LSP]
  :.    :Lsp-finder
  :h    :Hover-documentation
  :H    :Help
  :n    :Diagnostics-next
  :p    :Diagnostics-prev
  :d    :Definitions
  :D    :Declacations
  :t    :Type-definitions
  :i    :Implementation
  :R    :Rename
  :f    :Code-Format
  :a    :Code-Action
  :x    :Show-line-diagnostics
  :X    :Show-cursor-diagnostics
  :w    {:name :Workspace-action
         " "   :Close
         :a    :Add-workspace-folder
         :r    :Remove-workspace-folder
         :l    :List-workspaces}}}
