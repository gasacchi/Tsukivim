;; Module contians lsp-config commands

(local tsv (require :lib.tsukivim))

(fn start []
  "Start LSP"
  (tsv.cmd :LspStart)
  (tsv.notify.info "Starting LSP." 
                   [:fn:start :modules.lsp.commands]))

(fn stop []
  "Stop LSP"
  (tsv.cmd :LspStop)
  (tsv.notify.info "Stopping LSP." 
                   [:fn:stop :modules.lsp.commands]))

(fn restart []
  "Restart LSP"
  (tsv.cmd :LspRestart)
  (tsv.notify.info "Restarting LSP." 
                   [:fn:restart :modules.lsp.commands]))

{: start
 : stop
 : restart}

