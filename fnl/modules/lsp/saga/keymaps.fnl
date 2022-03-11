;; Module contains lspsaga keymaps

(local saga-cmd (require :modules.lsp.saga.commands))

{:normal
 {:F     [saga-cmd.lsp-finder              :Finder]
  :a     [saga-cmd.code-action             :Code-action]
  :h     [saga-cmd.hover                   :Hover]
  :H     [saga-cmd.signature-help          :Signature-help]
  :r     [saga-cmd.rename                  :Rename]
  :d     [saga-cmd.preview-definition      :Preview-definition]
  :X     [saga-cmd.line-diagnostic         :Line-diagnostics]
  :x     [saga-cmd.cursor-diagnostic       :Cursor-diagnostics]
  :n     [saga-cmd.next-diagnostic         :Next-diagnostics]
  :p     [saga-cmd.prev-diagnostic         :Prev-diagnostics]}
 :visual
 {:a     [saga-cmd.range-code-action       :Range-code-action]}}
