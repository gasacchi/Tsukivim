;; Module contains trouble commands

(local tsv (require :utils))

(fn trouble->commands [mode]
  (let [trouble (fn [name] (.. "TroubleToggle " name))
        (ok? trouble*) (tsv.require-plugin :trouble)
        opts {:skip_groups true :jump true}]
    (if ok?
      (match mode
        :toggle (fn []
                  (tsv.cmd :TroubleToggle))
        :close (fn []
                 (tsv.cmd :TroubleClose))
        :refresh (fn []
                   (tsv.cmd :TroubleRefresh))
        :workspace-diagnostics (fn []
                                 (tsv.cmd (trouble :workspace_diagnostics)))
        :document-diagnostics (fn []
                                (tsv.cmd (trouble :document_diagnostics)))
        :quickfix (fn []
                    (tsv.cmd (trouble :quickfix)))
        :loclist (fn []
                   (tsv.cmd (trouble :loclist)))
        :lsp-references (fn []
                          (tsv.cmd (trouble :lsp_references)))
        :lsp-definitions (fn []
                           (tsv.cmd (trouble :lsp_definitions)))
        :lsp-type-definitions (fn []
                                (tsv.cmd (trouble :lsp_type_definitions)))
        :next (fn []
                (trouble*.next opts))
        :prev (fn []
                (trouble*.previous opts))
        _ (tsv.notify.error (.. "Invalid mode: " 
                                mode
                                [:fn:trouble->commands 
                                 :modules.trouble.commands])))
      :otherwise (tsv.notify.error trouble*
                                   [:fn:trouble->commands
                                    :modules.trouble.commands]))))

{:toggle                (trouble->commands :toggle)
 :close                 (trouble->commands :close)
 :refresh               (trouble->commands :refresh)
 :workspace-diagnostics (trouble->commands :workspace-diagnostics)
 :document-diagnostics  (trouble->commands :document-diagnostics)
 :quickfix              (trouble->commands :quickfix)
 :loclist               (trouble->commands :loclist)
 :lsp-references        (trouble->commands :lsp-references)
 :lsp-definitions       (trouble->commands :lsp-definitions)
 :lsp-type-definitions  (trouble->commands :lsp-type-definitions)
 :next                  (trouble->commands :next)
 :prev                  (trouble->commands :prev)}

