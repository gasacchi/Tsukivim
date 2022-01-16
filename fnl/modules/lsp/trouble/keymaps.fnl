;; Module contains trouble keymaps

(local trouble-cmd (require :modules.lsp.trouble.commands))

{:normal 
 {:name :Trouble
  " " [:<Esc>                             :Close]
  :x  [trouble-cmd.toggle                 :Trouble-Toggle]
  :X  [trouble-cmd.close                  :Trouble-close]
  :R  [trouble-cmd.refresh                :Trouble-refresh]
  :w  [trouble-cmd.workspace-diagnostics  :Workspace-diagnostics]
  :W  [trouble-cmd.document-diagnostics   :Document-diagnostics]
  :q  [trouble-cmd.quickfix               :Quickfix]
  :l  [trouble-cmd.loclist                :Loclist]
  :r  [trouble-cmd.lsp-references         :Lsp-references]
  :d  [trouble-cmd.lsp-definitions        :Lsp-definitions]
  :t  [trouble-cmd.lsp-type-definitions   :Lsp-type-definitions]
  :n  [trouble-cmd.next                   :Next-diagnostics]
  :p  [trouble-cmd.prev                   :Prev-diagnostics]}}
