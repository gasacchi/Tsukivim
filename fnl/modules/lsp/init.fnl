;; Module for configure built-in Neovim LSP
(local {: plugin-exist?} (require :lib.tsukivim))

;; TODO: configure mappings for lsp
(fn on-attach [_ bufnr]
  "Function that run when lsp server attach on buffer"
  (let [set-keymap (fn [...] (vim.api.nvim_buf_set_keymap bufnr ...))
       set-option (fn [...] (vim.api.nvim_buf_set_option bufnr ...))
       opts {:noremap true :silent true}]

      ;; Trouble lsp mappings
      ;; see: ./trouble.fnl for trouble.nvim configuration
      (set-keymap :n :<leader>tq ":TroubleToggle quickfix<CR>" opts)
      (set-keymap :n :<leader>tl ":TroubleToggle loclist<CR>" opts)
      (set-keymap
        :n :<leader>tw ":TroubleToggle lsp_workspace_diagnostics<CR>" opts)
      (set-keymap
        :n :<leader>tr ":TroubleToggle lsp_references<CR>" opts)
      (set-keymap
        :n :<leader>td ":TroubleToggle lsp_document_diagnostics<CR>" opts)

      ;; Lsp saga mappings
      ;; see: ./saga.fnl for lspsaga.nvim configuration
      (set-keymap :n :<leader>l. ":Lspsaga lsp_finder<CR>" opts)
      (set-keymap :n :<leader>la ":Lspsaga code_action<CR>" opts)
      (set-keymap :x :<leader>la ":<C-U>Lspsaga range_code_action<CR>" opts)
      (set-keymap :n :<leader>lh ":Lspsaga hover_doc<CR>" opts)
      (set-keymap
        :n :<C-f> 
        ":lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>" opts)
      (set-keymap 
        :n :<C-b> 
        ":lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>" opts)
      (set-keymap :n :<leader>lH ":Lspsaga signature_help<CR>" opts)
      (set-keymap :n :<leader>lR ":Lspsaga rename<CR>" opts)
      (set-keymap :n :<leader>ld ":Lspsaga preview_definition<CR>" opts)
      (set-keymap :n :<leader>lx ":Lspsaga show_line_diagnostics<CR>" opts)
      (set-keymap :n :<leader>lX ":Lspsaga show_cursor_diagnostics<CR>" opts)
      (set-keymap :n :<leader>lp ":Lspsaga diagnostic_jump_prev<CR>" opts)
      (set-keymap :n :<leader>ln ":Lspsaga diagnostic_jump_next<CR>" opts)

      ;; Built in lsp
      (set-keymap :n :<leader>lD ":lua vim.lsp.buf.declaration()<CR>" opts)
      (set-keymap :n :<leader>li ":lua vim.lsp.buf.implementation()<CR>" opts)
      (set-keymap 
        :n :<leader>lwa ":lua vim.lsp.buf.add_workspace_folder()<CR>" opts)
      (set-keymap 
        :n :<leader>lwr ":lua vim.lsp.buf.remove_workspace_folder()<CR>" opts)
      (set-keymap 
        :n :<leader>lwl 
        ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folder()))<CR>" opts)
      (set-keymap :n :<leader>lt ":lua vim.lsp.buf.type_definition()<CR>" opts)
      (set-keymap :n :<leader>lf ":lua vim.lsp.buf.formatting()<CR>" opts)))

(fn make-config []
  "Function that return table for lspconfig setup with cmp
   capabilities attached"
  (when (plugin-exist? :cmp-nvim-lsp)
    (let [cmp_nvim_lsp (require :cmp_nvim_lsp)
        capabilities (cmp_nvim_lsp.update_capabilities 
                       (vim.lsp.protocol.make_client_capabilities))]
        {: capabilities :on_attach on-attach})))

(fn config []
  "Function that run after nvim-lspconfig loaded"
  (when (plugin-exist? :nvim-lspconfig)
   (let [conf (make_config)
        servers [:svelte :cssls :html]
        nvim_lsp (require :lspconfig)]
    (each [_ lsp (ipairs servers)]
      (tset (. nvim_lsp lsp) :setup conf)))))

{: config}
