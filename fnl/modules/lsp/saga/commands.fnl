;; Module contains lspsaga commands

(local tsv (require :lib.tsukivim))

(fn saga->commands [cmd]
  (let [(ok? err) (tsv.require-plugin :lspsaga.hover)] ;; just for error
    (if ok?
      (match cmd
        :lsp-finder (fn []
                      ((. (require :lspsaga.provider) :lsp_finder)))
        :code-action (fn []
                       ((. (require :lspsaga.codeaction) :code_action)))
        :range-code-action (fn []
                             ((. (require :lspsaga.codeaction) 
                                 :range_code_action)))
        :hover (fn []
                 ((. (require :lspsaga.hover) :render_hover_doc)))
        :scroll-action (fn [n]
                         (fn []
                           ((. (require :lspsaga.action) 
                               :smart_scroll_with_saga) n)))
        :signature-help (fn []
                          ((. (require :lspsaga.signaturehelp) 
                              :signature_help)))
        :rename (fn []
                  ((. (require :lspsaga.rename) :rename)))
        :preview-definition (fn []
                              ((. (require :lspsaga.provider) 
                                  :preview_definition)))
        :line-diagnostic (fn []
                           ((. (require :lspsaga.diagnostic)
                               :show_line_diagnostics)))
        :cursor-diagnostic (fn []
                             ((. (require :lspsaga.diagnostic)
                                 :show_cursor_diagnostics)))
        :next-diagnostic (fn []
                           (tsv.cmd "Lspsaga diagnostic_jump_next"))
        :prev-diagnostic (fn []
                           (tsv.cmd "Lspsaga diagnostic_jump_prev"))
        _ (tsv.notify.error (.. "Invalid cmd: " cmd)
                            [:fn:saga->commands :modules.lsp.saga.commands]))
      :otherwise (tsv.notify.error err
                                   [:fn:saga->commands 
                                    :modules.lsp.saga.commands]))))

{:lsp-finder         (saga->commands :lsp-finder)
 :code-action        (saga->commands :code-action)
 :range-code-action  (saga->commands :range-code-action)
 :hover              (saga->commands :hover)
 :scroll-action      (saga->commands :scroll-action)
 :signature-help     (saga->commands :signature-help)
 :rename             (saga->commands :rename)
 :preview-definition (saga->commands :preview-definition)
 :line-diagnostic    (saga->commands :line-diagnostic)
 :cursor-diagnostic  (saga->commands :cursor-diagnostic)
 :next-diagnostic    (saga->commands :next-diagnostic)
 :prev-diagnostic    (saga->commands :prev-diagnostic)}
