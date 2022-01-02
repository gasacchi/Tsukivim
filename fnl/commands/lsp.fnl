;; Module contains lsp commands
(local {: cmd : notify} (require :lib.tsukivim))

(local lsp-commands {})

(fn lsp-commands.start-server []
  "Start LSP"
  (cmd :LspStart)
  (notify.info "Starting LSP." "LSP: start"))

(fn lsp-commands.stop-server []
  "Stop LSP"
  (cmd :LspStop)
  (notify.info "Stopping LSP." "LSP: stop"))

(fn lsp-commands.restart-server []
  "Restart LSP"
  (cmd :LspRestart)
  (notify.info "Restarting LSP." "LSP: restart"))

lsp-commands

