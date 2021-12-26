;; Module configure packer.nvim for installing plugin 
(local packer (require :packer))
(local packer-utils (require :packer.util))

(packer.init 
  {:display 
   {:open_fn (lambda []
              (packer-utils.float {:border :single}))
    :prompt_border :single}
   :profile {:enable true :threshold 0}})

;; TODO: sync on save with autocommand
(packer.startup 
  (fn [use]
    "Packer use this declaration to compile to ../plugin/packer_compiled.lua
     then install to ~/.local/share/nvim/site/pack/packer/start/ or 
     ~/local/share/nvim/site/pack/packer/opt/ if the plugin flagged as `opt`"

    ;; Core plugins for managing plugin and fennel in Tsukivim ;;;;;;;;;;;;;;;;;
    ;; Packer plugin manager
     (use :wbthomason/packer.nvim)
        

    ;; Fennel integrations in neovim
    ;; see: ../init.lua:37 for adding fennel configuration
     (use :rktjmp/hotpot.nvim)

     ;; Essential for some plugins
     (use [:nvim-lua/plenary.nvim :nvim-lua/popup.nvim])

     ;; For fancy icon
     (use 
       {1 :kyazdani42/nvim-web-devicons})
        

     ;; Replacement for filetypes.vim faster load
     (use :nathom/filetype.nvim)


    ;; LSP related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Neovim built-in LSP
    ;; see: modules/lsp/init.fnl for configure nvim-lspconfig
     (use {1 :neovim/nvim-lspconfig
           :event :bufReadPre
           :config "require'modules.lsp'"})

    ;; Neovim code completions
    ;; see: modules/lsp/completion.fnl for configure cmp.nvim
     (use 
       {1 :hrsh7th/nvim-cmp 
        :event :InsertEnter 
        :config "require'modules.lsp.completion'"})
     
     (use 
       {1 :hrsh7th/cmp-nvim-lsp
        :after :nvim-cmp})
     
     (use 
       {1 :hrsh7th/cmp-buffer
        :after :cmp-nvim-lsp})
     
     (use 
       {1 :hrsh7th/cmp-path
        :after :cmp-buffer})

    ;; Pretty diagnostic list
    ;; see: modules/lsp/trouble.fnl for configure trouble.nvim
     (use 
       {1 :folke/trouble.nvim
        :cmd [:Trouble :TroubleToggle]
        :config "require'modules.lsp.trouble'"})

    ;; LSP UI
    ;; NOTE: currently using fork repo until glepnir come back
    ;; see: modules/lsp/saga.fnl for configure lspsaga
     (use 
       {1 :tami5/lspsaga.nvim
        :event :BufRead
        :config "require'modules.lsp.saga'"})
     
    ;; Programming language related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Fennel
    (use 
      {1 :bakpakin/fennel.vim
       :ft :fennel})
    
    ;; Lua
    (use 
      {1 :tbastos/vim-lua
       :ft :lua})

    ;; Rust
    (use 
      {1 :rust-lang/rust.vim
       :ft :rust})

    (use 
      {1 :othree/html5.vim
       :ft :html})
    
    ;; Git related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Magit port for neovim
    ;; see: modules/git/neogit.fnl for configure neogit
    (use 
      {1 :TimUntersberger/neogit
       :cmd :Neogit 
       :config "require'modules.git.neogit'"})

    ;; Git signs
    ;; see: modules/git/gitsigns.fnl for configure gitsigns
    (use 
      {1 :lewis6991/gitsigns.nvim 
       :event :BufReadPre
       :config "require'modules.git.gitsigns'"})

    ;; Utility related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Telescope Fuzzy finder
    ;; see: modules/utils/telescope.fnl for configure telescope
    (use 
      {1 :nvim-telescope/telescope.nvim
       :cmd :Telescope
       :requires [{1 :nvim-telescope/telescope-fzf-native.nvim
                   :run :make}]
       :config "require'modules.utils.telescope'"})
    
    ;; Nvim file tree
    ;; see: modules/utils/nvim-tree.fnl for configure nvim-tree
    (use 
      {1 :kyazdani42/nvim-tree.lua
       :cmd :NvimTreeToggle
       :config "require'modules.utils.nvim-tree'"})
    
    ;; Extends TODO comment 
    ;; see: modules/utils/todo-comments.fnl for configure todo-comments
    (use 
      {1 :folke/todo-comments.nvim
       :config "require'modules.utils.todo-comments'"}) 

    ;; display neovim startup time
    ;; see modules/utils/nvim-startup.fnl for configure nvim-startup
    (use 
      {1 :dstein64/vim-startuptime
       :cmd :StartupTime})
           

    ;; UI related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Startup dashboard
    ;; see: modules/ui/dashboard.fnl for configure dashboard
    (use 
      {1 :goolord/alpha-nvim
       :config "require'modules.ui.dashboard'"})

    ;; Treesitter
    ;; see: modules/ui/treesitter.fnl for configure treesitter
    (use 
      {1 :nvim-treesitter/nvim-treesitter
       :run :TSUpdate
       :event :BufRead
       :config "require'modules.ui.treesitter'"})

    ;; Rainbow parentheses
    ;; see: modules/ui/nvim-treesitter.fnl for configure nvim-ts-rainbow
    (use 
      {1 :p00f/nvim-ts-rainbow
       :after :nvim-treesitter})

    ;; Add underline for same word
    (use 
      {1 :yamatsum/nvim-cursorline
       :event :BufRead})

    ;; Indent 
    ;; see: modules/ui/indent-blankline.fnl for configure indent-blankline
    (use 
      {1 :lukas-reineke/indent-blankline.nvim
       :event :BufRead})
       ; :setup (require :modules.ui.indent-blankline)})

    ;; Statusline
    ;; see: modules/ui/statusline.fnl for configure statusline
    (use 
      {1 :nvim-lualine/lualine.nvim
       :event :VimEnter
       :config "require'modules.ui.statusline'"})

    ;; Theme
    ;; see: modules/ui/themes.fnl for configure themes
    (use 
      {1 :folke/tokyonight.nvim
       :config "require 'modules.ui.themes'"})

    ;; Bufferline
    ;; see: modules/ui/bufferline.fnl for configure bufferline
    (use 
      {1 :akinsho/bufferline.nvim
       :event :BufReadPre
       :config "require'modules.ui.bufferline'"})

    ;; Hightlight HEX color
    ;; see: modules/ui/colorizer.fnl for configure nvim-colorizer
    (use 
      {1 :norcalli/nvim-colorizer.lua
       :cmd :ColorizerToggle})

    ;; Editing related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;S-expression editing make easier
    (use 
      {1 :gpanders/nvim-parinfer
       :ft [:fennel]})

    ;; buffer delete without losting window layout
    (use 
      {1 :famiu/bufdelete.nvim
       :cmd :Bdelete})

    ;; auto comment
    ;; see: modules/editing/kommentary.fnl for configue kommentary
    (use 
      {1 :b3nj5m1n/kommentary
       :keys [:gc]
       :config "require'modules.editing.kommentary'"})

    ;; better escape with fast jk
    ;; see: modules/editing/better-escape.fnl
    (use
      {1 :max397574/better-escape.nvim
       :event :InsertEnter
       :config "require'modules.editing.better-escape'"})

    ;; Mapping related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; which-key for documenting keymaps
    ;; see: keymaps.fnl
    (use 
      {1 :folke/which-key.nvim
       :event :VimEnter
       :config "require 'keymaps'"})))

; sync plugin when first time install tsukivim
(if packer_bootstrap 
       (packer.sync))

