;; Module for configure nvim-cmp & lspkind.nvim
(local tsv (require :lib.tsukivim))

;; Set icons for lspkind.nvim
(local kind-icons 
   {:Text  "ﭨ"
    :Method  ""
    :Function  ""
    :Constructor  ""
    :Field  ""
    :Variable  ""
    :Class  "ﴯ"
    :Interface  ""
    :Module  ""
    :Property  "ﰠ"
    :Unit  ""
    :Value  ""
    :Enum  ""
    :Keyword  ""
    :Snippet  ""
    :Color  ""
    :File  ""
    :Reference  ""
    :Folder  ""
    :EnumMember  ""
    :Constant  ""
    :Struct  ""
    :Event  ""
    :Operator  ""
    :TypeParameter  ""})

;; Snippet configuration
; (local snippet 
;     {:expand (fn [args]
;                "Setup luasnip for cmp-nvim"
;                (let [(ok? luasnip) (require-plugin :luasnip)] 
;                  (when ok?
;                    (luasnip.lsp_expand args.body))))})

;; Set completion menu format
(local formatting 
    {:format (fn [entry vim-item]
               "Formating setup for cmp-nvim"
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
      {:name :buffer}])


;; Use experimental features
(local experimental 
     {:ghost_text true})

(let [(ok? cmp) (tsv.require-plugin :cmp)]
    (if ok?
      (do
        (tsv.let-global :completeopt "menu,menuone,noselect")
        (cmp.setup 
            {: formatting
             : sources
             :mapping {:<Tab> (cmp.mapping.select_next_item)
                       :<S-Tab> (cmp.mapping.select_prev_item)
                       :<C-Space> (cmp.mapping.complete)
                       :<C-e> (cmp.mapping.close)
                       :<CR> (cmp.mapping.confirm 
                               {:behaviour cmp.ConfirmBehavior.Replace 
                                :select true})}
              : experimental}))
     :otherwise (tsv.notify.error cmp
                                  "modules.lsp.completion.config")))

