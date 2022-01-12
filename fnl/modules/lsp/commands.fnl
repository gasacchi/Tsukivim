;; Module contians lsp-config commands

(local tsv (require :lib.tsukivim))

(fn start []
  "Start LSP"
  (tsv.cmd :LspStart)
  (tsv.notify.info "Starting LSP." 
                   "modules.lsp.commands: fn start"))

(fn stop []
  "Stop LSP"
  (tsv.cmd :LspStop)
  (tsv.notify.info "Stopping LSP." "modules.lsp.commands: fn stop"))

(fn restart []
  "Restart LSP"
  (tsv.cmd :LspRestart)
  (tsv.notify.info "Restarting LSP." "modules.lsp.commands: fn restart"))

{: start
 : stop
 : restart}

