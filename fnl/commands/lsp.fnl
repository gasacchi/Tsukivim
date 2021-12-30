;; Module contains lsp commands
(local {: cmd} (require :lib.tsukivim))

(local lsp-commands {})

(fn lsp-commands.start-server []
  "Start LSP"
  (cmd :LspStart))

(fn lsp-commands.stop-server []
  "Stop LSP"
  (cmd :LspStop))

(fn lsp-commands.restart-server []
  "Restart LSP"
  (cmd :LspRestart))

lsp-commands

