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

;; Set completion menu format
(local formatting 
    {:format (fn [entry vim-item]
               "Formating setup for cmp-nvim"
                 (let [menu {:buffer " :: Buffer"
                             :nvim_lsp " :: LSP"
                             :vsnip " :: Snippet"
                             :nvim_lua " :: Lua"
                             :latex_symbols " :: Latex"}]
                     (tset vim-item :menu (.. vim-item.kind 
                                              (. menu entry.source.name)))
                     (tset vim-item :kind (. kind-icons vim-item.kind))
                     vim-item))
     :fields [:kind :abbr :menu]})

(fn has-word-before []
  (let [(line col) (unpack (vim.api.nvim_win_get_cursor 0))
        buf-line (: (: (. (vim.api.nvim_buf_get_lines 
                            0 
                            (- line 1) 
                            line 
                            true) 1) :sub col col) :match :%s)]
    (and (not= col 0) (= buf-line nil))))

(fn feed-keys [key mode]
  (vim.api.nvim_feedkeys 
    (vim.api.nvim_replace_termcodes key true true true) mode true))

(local super-tab 
  (let [(ok? cmp) (tsv.require-plugin :cmp)]
    (if ok?
      {:<Tab> (cmp.mapping (fn [fallback]
                             (if (cmp.visible) ; ?
                               (cmp.select_next_item)
                               (= (vim.fn.vsnip#available 1) 1) ; ?
                               (feed-keys "<Plug>(vsnip-expand-or-jump)" "")
                               (has-word-before) ; ?
                               (cmp.complete)
                               :otherwise (fallback))) [:i :s])
       :<S-Tab> (cmp.mapping (fn []
                               (if (cmp.visible)
                                 (cmp.select_prev_item)
                                 (= (vim.fn.vsnip#jumpable -1) 1) ; ?
                                 (feed-keys "<Plug>(vsnip-jump-prev)" ""))) 
                             [:i :s])}
      :otherwise (tsv.notify.error 
                   cmp
                   [:local:super-tab :modules.lsp.completion.config]))))

;; TODO: override snippet
(fn vsnip-config []
  (tsv.let-global :vsnip_snippet_dir (.. (vim.fn.stdpath :config) :/snippets)))

(let [(ok? cmp) (tsv.require-plugin :cmp)]
    (if ok?
      (do
        (tsv.let-global :completeopt "menu,menuone,noselect")
        (vsnip-config)
        (cmp.setup 
            {:snippet {:expand (fn [args]
                                 ((. vim.fn :vsnip#anonymous) args.body))}
             : formatting
             :sources [{:name :nvim_lsp}
                       {:name :vsnip}
                       {:name :buffer}]
             :mapping (vim.tbl_extend
                        :keep
                        {:<C-Space> (cmp.mapping.complete)
                         :<C-e> (cmp.mapping.close)
                         :<CR> (cmp.mapping.confirm 
                                 {:behaviour cmp.ConfirmBehavior.Replace 
                                  :select true})} super-tab)
              :experimental {:ghost_text true}}))
     :otherwise (tsv.notify.error cmp
                                  [:module :modules.lsp.completion.config])))

