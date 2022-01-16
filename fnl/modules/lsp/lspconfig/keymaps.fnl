;; Modules contains lspconfig keymaps

(local lspconfig-cmd (require :modules.lsp.lspconfig.commands))

{:normal
 {:name :LSP
  " " [:<Esc>                                     :Close]
  :D  [lspconfig-cmd.declaration                  :Declaration]
  :f  [lspconfig-cmd.format                       :Format]
  :i  [lspconfig-cmd.implementation               :Implementation]
  :s  [lspconfig-cmd.start                        :Start]
  :S  [lspconfig-cmd.stop                         :Stop]
  :R  [lspconfig-cmd.restart                      :Restart]
  :w  {:name :Workspace
       " " [:<Esc>                                :Close]
       :a  [lspconfig-cmd.workspace-add-folder    :Add-folder] 
       :r  [lspconfig-cmd.workspace-remove-folder :Remove-folder] 
       :l  [lspconfig-cmd.workspace-list-folder   :List-folder]}}
 :visual 
 {:name :LSP
  " " [:<Esc>                                     :Close]
  :f  [lspconfig-cmd.range-format                 :Range-format]}} 
