;; Module contians lsp-config commands

(local tsv (require :lib.tsukivim))

(fn start []
  "Start LSP"
  (tsv.cmd :LspStart)
  (tsv.notify.info "Starting LSP." "LSP: start"))

(fn stop []
  "Stop LSP"
  (tsv.cmd :LspStop)
  (tsv.notify.info "Stopping LSP." "LSP: stop"))

(fn restart []
  "Restart LSP"
  (tsv.cmd :LspRestart)
  (tsv.notify.info "Restarting LSP." "LSP: restart"))

{: start
 : stop
 : restart}

