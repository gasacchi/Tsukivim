;; Module configure packer.nvim for installing plugin 
(local packer (require :packer))

(packer.startup 
  (fn [use]
    "Packer use this declaration to compile to ../plugin/packer_compiled.lua
     then install to ~/.local/share/nvim/site/pack/packer/start/"
    (let [{:config lsp-config} (require :modules.lsp)
          {:config cmp-config :setup cmp-setup} (require 
                                                  :modules.lsp.completion)
          {:config trouble-config} (require :modules.lsp.trouble)
          {:config saga-config} (require :modules.lsp.saga)
          {:config neogit-config} (require :modules.git.neogit)
          {:config gitsigns-config} (require :modules.git.gitsigns)
          {:config telescope-config} (require :modules.utils.telescope)
          {:config nvim-tree-config} (require :modules.utils.nvim-tree)
          {:config todo-comments-config} (require 
                                           :modules.utils.todo-comments)
          {:config marks-config} (require :modules.utils.marks)
          {:config nvim-treesitter-config} (require 
                                             :modules.ui.nvim-treesitter)
          {:setup indent-blankline-setup} (require 
                                            :modules.ui.indent-blankline)
          {:config statusline-config} (require :modules.ui.statusline)
          {:config themes-config :setup themes-setup} (require 
                                                        :modules.ui.themes)
          {:config bufferline-config} (require :modules.ui.bufferline)
          {:config colorizer-config} (require :modules.ui.colorizer)
          {:config kommentary-config} (require :modules.editing.kommentary)
          {:config better-escape-config} (require :modules.editing.better-escape)
          {:config keymaps-config :setup keymaps-setup} (require :keymaps)]

    ;; Core plugins for managing plugin and fennel in Tsukivim ;;;;;;;;;;;;;;;;;
    ;; Packer plugin manager
    (use :wbthomason/packer.nvim)

    ;; Fennel integrations in neovim
    ;; see: ../init.lua:33 for adding fennel configuration
    (use :rktjmp/hotpot.nvim)

    ;; LSP related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Neovim built-in LSP
    ;; see: modules/lsp/init.fnl for configure nvim-lspconfig
    (use {1 :neovim/nvim-lspconfig
          :config (lsp-config)})

    ;; Fancy Pmenu with icon
    ;; see: modules/lsp/completion.fnl add icon for nvim-cmp
    (use :onsails/lspkind-nvim)

    ;; Neovim code completions
    ;; see: modules/lsp/completion.fnl for configure cmp.nvim
    (use 
      {1 :hrsh7th/nvim-cmp 
        :requires [:hrsh7th/cmp-nvim-lsp :hrsh7th/cmp-vsnip :hrsh7th/vim-vsnip
                   :hrsh7th/cmp-buffer :hrsh7th/cmp-path :hrsh7th/cmp-nvim-lua]
        :setup (cmp-setup)
        :config (cmp-config)})

    ;; Pretty diagnostic list
    ;; see: modules/lsp/trouble.fnl for configure trouble.nvim
    (use 
      {1 :folke/trouble.nvim
       :config (trouble-config)})

    ;; LSP UI
    ;; NOTE: currently using fork repo until glepnir come back
    ;; see: modules/lsp/saga.fnl for configure lspsaga
    (use 
      {1 :tami5/lspsaga.nvim
       :config (saga-config)})


    ;; Programming language related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Syntax support for various programming language
    (use :sheerun/vim-polyglot)
    
    ;; Git related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Magit port for neovim
    ;; see: modules/git/neogit.fnl for configure neogit
    (use 
      {1 :TimUntersberger/neogit
       :requires [:nvim-lua/plenary.nvim]
       :config (neogit-config)})

    ;; Git signs
    ;; see: modules/git/gitsigns.fnl for configure gitsigns
    (use 
      {1 :lewis6991/gitsigns.nvim 
       :requires [:nvim-lua/plenary.nvim]
       :config (gitsigns-config)})

    ;; Utility related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Telescope Fuzzy finder
    ;; see: modules/utils/telescope.fnl for configure telescope
    (use 
      {1 :nvim-telescope/telescope.nvim
       :requires [:nvim-lua/popup.nvim :nvim-lua/plenary.nvim]
       :config (telescope-config)})

    ;; Telescope Native
    (use 
      {1 :nvim-telescope/telescope-fzf-native.nvim
       :run :make})
    
    ;; Nvim file tree
    ;; see: modules/utils/nvim-tree.fnl for configure nvim-tree
    (use 
      {1 :kyazdani42/nvim-tree.lua
       :requires [:kyazdani42/nvim-web-devicons]
       :config (nvim-tree-config)})
    
    ;; Extends TODO comment 
    ;; see: modules/utils/todo-comments.fnl for configure todo-comments
    (use 
      {1 :folke/todo-comments.nvim
       :config (todo-comments-config)})
    
    ;; Marks viewer
    ;; (use 
    ;;   {1 :chentau/marks.nvim
    ;;    :config (marks-config)})
    
    ;; UI related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Treesitter
    ;; see: modules/ui/nvim-treesitter.fnl for configure treesitter
    (use 
      {1 :nvim-treesitter/nvim-treesitter
       :run :TSUpdate
       :config (nvim-treesitter-config)})

    ;; Rainbow parentheses
    ;; see: modules/ui/nvim-treesitter.fnl for configure nvim-ts-rainbow
    (use :p00f/nvim-ts-rainbow)

    ;; Add underline for same word
    (use :yamatsum/nvim-cursorline)

    ;; Indent 
    ;; see: modules/ui/indent-blankline.fnl for configure indent-blankline
    (use 
      {1 :lukas-reineke/indent-blankline.nvim
       :setup (indent-blankline-setup)})

    ;; Statusline
    ;; see: modules/ui/statusline.fnl for configure statusline
    (use 
      {1 :nvim-lualine/lualine.nvim
       :config (statusline-config)})

    ;; Theme
    ;; see: modules/ui/themes.fnl for configure themes
    (use 
      {1 :folke/tokyonight.nvim
       :setup (themes-setup)
       :config (themes-config)})

    ;; Bufferline
    ;; see: modules/ui/bufferline.fnl for configure bufferline
    (use 
      {1 :akinsho/bufferline.nvim
       :config (bufferline-config)})

    ;; Hightlight HEX color
    ;; see: modules/ui/colorizer.fnl for configure nvim-colorizer
    (use 
      {1 :norcalli/nvim-colorizer.lua
       :config (colorizer-config)})

    ;; Editing related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; buffer delete without losting window layout
    (use :famiu/bufdelete.nvim)

    ;; auto comment
    ;; see: modules/editing/kommentary.fnl for configue kommentary
    (use 
      {1 :b3nj5m1n/kommentary
       :config (kommentary-config)})

    ;; better escape with fast jk
    ;; see: modules/editing/better-escape.fnl
    (use
      {1 :max397574/better-escape.nvim
       :config (better-escape-config)})

    ;; Mapping related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; which-key for documenting keymaps
    ;; see: keymaps.fnl
    (use 
      {1 :folke/which-key.nvim
       :setup (keymaps-setup)
       :config (keymaps-config)})

    ;; sync plugin when first time install tsukivim
    (if packer_bootstrap 
      (packer.sync)))))


