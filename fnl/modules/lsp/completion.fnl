;; Module for configure nvim-cmp & lspkind.nvim
(import-macros {: let-global!} :lib.macro.vim )
(local {: plugin-exist?} (require :lib.tsukivim))



(fn setup []
    "Function that run before nvim-cmp loaded"
    ;; preselect when completion popup
    (let-global! :completeopt "menu,menuone,noselect"))

;; Set icons for lspkind.nvim
(local kind-icons 
       {:Text "ﭨ"
       :Method ""
       :Function ""
       :Constructor ""
       :Field ""
       :Variable ""
       :Class "ﴰ"
       :Interface ""
       :Module ""
       :Property "ﰠ"
       :Unit ""
       :Value ""
       :Enum ""
       :Keyword ""
       :Snippet ""
       :Color ""
       :File ""
       :Reference ""
       :Folder ""
       :EnumMember ""
       :Constant ""
       :Struct " "
       :Event ""
       :Operator ""
       :TypeParameter ""})

;; Snippet configuration
(local snippet 
    {:expand (fn [args]
                 ((. vim.fn "vsnip#anonymous") args.body))})

;; Set completion menu format
(local formatting 
    {:format (fn [entry vim-item]
                 (let [menu {:buffer " :: Buffer"
                             :nvim_lsp " :: LSP"
                             :luasnip " :: Snippet"
                             :nvim_lua " :: Lua"
                             :latex_symbols " :: Latex"}]
                     (tset vim-item :menu (.. vim-item.kind (. menu entry.source.name)))
                     (tset vim-item :kind (. kind-icons vim-item.kind))
                     vim-item))
     :fields [:kind :abbr :menu]})

;; Set list of sources used by nvim-cmp
(local sources 
     [{:name :nvim_lsp}
      {:name :vsnip}
      ;; {:name :path}
      {:name :nvim_lua}
      {:name :buffer}])


;; Set mapping for nvim-cmp
(fn mapping []
    (when (plugin-exist? :nvim-cmp)
        (let [cmp (require :cmp)]
            {:<Tab> (cmp.mapping.select_next_item)
                  :<S-Tab> (cmp.mapping.select_prev_item)
                  :<C-Space> (cmp.mapping.complete)
                  :<C-e> (cmp.mapping.close)
                  :<CR> (cmp.mapping.confirm 
                            {:behaviour cmp.ConfirmBehavior.Replace
                             :select true})})))

;; Use experimental features
(local experimental 
     {:ghost_text true})

;; TODO: set config when plugin-exist?
(fn config [] 
    "Function that run when nvim-cmp is loaded"
    (when (plugin-exist? :nvim-cmp)
        (let [cmp (require :cmp)]
            (cmp.setup 
                {: snippet 
                 : formatting
                 : sources
                 :mapping (mapping)
                 : experimental}))))

{: setup
 : config}

