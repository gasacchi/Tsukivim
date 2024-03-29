;; Module for configure lspconfig

(local tsv (require :utils))

(fn on-attach [_ bufnr]
  (let [(ok? which-key)     (tsv.require-plugin :which-key)
        lspconfig-keys      (require :modules.lspconfig.keymaps)
        saga-keys           (require :modules.lspsaga.keymaps)
        trouble-keys-normal (. (require :modules.trouble.keymaps) 
                               :normal)
        lsp-keys-normal     (vim.tbl_extend 
                              :keep 
                              (. lspconfig-keys :normal) 
                              (. saga-keys :normal))
        lsp-keys-visual     (vim.tbl_extend 
                              :keep 
                              (. lspconfig-keys :visual) 
                              (. saga-keys :visual))]
    (if ok?
      (do
        (which-key.register lsp-keys-normal {:buffer bufnr 
                                             :prefix :<leader>l})
        (which-key.register lsp-keys-visual {:buffer bufnr
                                             :prefix :<leader>l
                                             :mode :v})
        (which-key.register trouble-keys-normal {:buffer bufnr
                                                 :prefix :<leader>x})) 
      :otherwise (tsv.notify.error which-key
                                   [:fn:on-attach 
                                    :modules.lspconfig.config]))))

(fn make-config []
  (let [(ok? cmp-nvim-lsp) (tsv.require-plugin :cmp_nvim_lsp)]
    (if ok?
      {:capabilities (cmp-nvim-lsp.update_capabilities 
                        (vim.lsp.protocol.make_client_capabilities))
       :on_attach on-attach}
      :otherwise (tsv.notify.error cmp-nvim-lsp
                                   [:fn:make-config 
                                    :modules.lspconfig.config]))))

(let [(ok? lsp-config) (tsv.require-plugin :lspconfig)
      servers          [:svelte :tsserver :cssls :html :emmet_ls :jsonls :prismals :rust_analyzer :tailwindcss]
      config           (make-config)]
  (if ok?
    (each [_ lsp (ipairs servers)]
      ((. lsp-config lsp :setup) config))
    :otherwise (tsv.notify.error lsp-config
                                 [:module :modules.lspconfig.config])))

