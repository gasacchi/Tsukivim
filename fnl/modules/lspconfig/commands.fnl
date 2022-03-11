;; Module contains lspconfig commands

(local tsv (require :utils))

(fn declaration []
  "Display declaration"
  (vim.lsp.buf.declaration))

(fn implementation []
  "Display implementation"
  (vim.lsp.buf.implementation))

(fn workspace-add-folder []
  "Add folder to workspace"
  (vim.lsp.buf.add_workspace_folder))

(fn workspace-remove-folder []
  "Remove folder from workspace"
  (vim.lsp.buf.add_workspace_folder))

(fn workspace-list-folder []
  "Display notify list of folder in workspace"
  (tsv.notify.info (vim.inspect (vim.lsp.buf.list_workspace_folders))
                   [:fn:workspace-list-folder :modules.lspconfig.commands]))

(fn format []
  "Format the file"
  (vim.lsp.buf.formatting))

(fn range-format []
  "Format with range"
  (vim.lsp.buf.range_formatting))

(fn start []
  "Start LSP"
  (tsv.cmd :LspStart)
  (tsv.notify.info "Starting LSP." 
                   [:fn:start :modules.lspconfig.commands]))

(fn stop []
  "Stop LSP"
  (tsv.cmd :LspStop)
  (tsv.notify.info "Stopping LSP." 
                   [:fn:stop :modules.lspconfig.commands]))

(fn restart []
  "Restart LSP"
  (tsv.cmd :LspRestart)
  (tsv.notify.info "Restarting LSP." 
                   [:fn:restart :modules.lspconfig.commands]))

{: declaration
 : implementation
 : workspace-add-folder
 : workspace-remove-folder
 : workspace-list-folder
 : format
 : start
 : stop
 : restart}

