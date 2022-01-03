;; Module configure packer.nvim for installing plugin 
(local packer (require :packer))
(local packer-utils (require :packer.util))

(packer.init 
  {:display 
   {:open_fn (lambda []
              (packer-utils.float {:border :single}))
    :prompt_border :single
    :profile {:enable true :threshold 0}}})

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
     (use
       {1 :nvim-lua/plenary.nvim
        :module :plenary})
     
     (use
       {1 :nvim-lua/popup.nvim
        :module :popup})
     
     ;; For fancy icon
     (use
       {1 :kyazdani42/nvim-web-devicons
        :module :nvim-web-devicons})

     ;; Replacement for filetypes.vim faster load
     (use :nathom/filetype.nvim)


    ;; LSP related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Neovim built-in LSP
    ;; see: modules/lsp/init.fnl for configure nvim-lspconfig
    ;; load on BufReadPre
     (use 
       {1 :neovim/nvim-lspconfig
        :event :BufReadPre
        :config "require'modules.lsp'"})

    ;; Neovim code completions
    ;; see: modules/lsp/completion.fnl for configure cmp.nvim
    ;; load on InsertEnter
     (use
       {1 :hrsh7th/nvim-cmp 
        :event :InsertEnter 
        :config "require'modules.lsp.completion'"})
     
     ;; load after nvim-cmp
     (use
       {1 :hrsh7th/cmp-nvim-lsp
        :module :cmp_nvim_lsp})

     ;; load after cmp-nvim-lsp
     (use
       {1 :hrsh7th/cmp-buffer
        :after :nvim-cmp})

    ;; Pretty diagnostic list
    ;; see: modules/lsp/trouble.fnl for configure trouble.nvim
      ;; load when using Trouble / TroubleToggle command 
     (use
       {1 :folke/trouble.nvim
        :cmd [:Trouble :TroubleToggle]
        :config "require'modules.lsp.trouble'"})

    ;; LSP UI
    ;; see: modules/lsp/saga.fnl for configure lspsaga
    ;; load on BufRead
     (use
       {1 :tami5/lspsaga.nvim
        :event :BufRead
        :config "require'modules.lsp.saga'"})
     
    ;; Programming language related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Fennel
    ;; load only for fennel file
    (use
      {1 :bakpakin/fennel.vim
       :ft :fennel})
    
    ;; Lua
    ;; load only for lua file
    (use
      {1 :tbastos/vim-lua
       :ft :lua})

    ;; Rust
    ;; load only for rust file
    (use
      {1 :rust-lang/rust.vim
       :ft :rust})
    
    ;; Html
    ;; load only for html file
    (use
      {1 :othree/html5.vim
       :ft :html})
    
    ;; Json
    ;; load only for json file
    (use
      {1 :elzr/vim-json
       :ft :json})

    ;; toml
    ;; load only for toml file
    (use
      {1 :cespare/vim-toml
       :ft :toml})
    
    ;; Javascript
    ;; load only for javascript file
    (use
      {1 :pangloss/vim-javascript
       :ft :javascript})

    ;; Typescript
    ;;load only for typescript file
    (use
      {1 :HerringtonDarkholme/yats.vim
       :ft :typescript})

    ;; Svelte
    ;; load only for svelte file
    (use
      {1 :leafOfTree/vim-svelte-plugin
       :ft :svelte})

    ;; Markdown
    ;; load only for markdown file
    (use
      {1 :plasticboy/vim-markdown
       :ft :markdown})

    ;; Fish
    ;; load only for fish file
    (use
      {1 :blankname/vim-fish
       :ft :fish})
    
    ;; Sh/Bash
    ;; load only for sh / bash file
    (use
      {1 :arzg/vim-sh
       :ft [:sh :bash]})

    ;; Swayconfig
    ;; load only for swayconfig file
    (use
      {1 :jamespeapen/swayconfig.vim
       :ft :swayconfig})
    
    ;; Git related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Magit port for neovim
    ;; see: modules/git/neogit.fnl for configure neogit
    ;; load when using Neogit command 
    (use
      {1 :TimUntersberger/neogit
       :cmd :Neogit 
       :config "require'modules.git.neogit'"})

    ;; Git signs
    ;; see: modules/git/gitsigns.fnl for configure gitsigns
    ;; load on BufReadPre
    (use
      {1 :lewis6991/gitsigns.nvim 
       :event :BufReadPre
       :config "require'modules.git.gitsigns'"})

    ;; Utility related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Telescope Fuzzy finder
    ;; see: modules/utils/telescope.fnl for configure telescope
    ;; load when using Telescope command 
    (use
      {1 :nvim-telescope/telescope.nvim
       :cmd :Telescope
       :module :telescope
       :config "require'modules.utils.telescope'"})
    (use 
      {1 :nvim-telescope/telescope-fzf-native.nvim
       :cmd :Telescope
       :run :make})

    (use 
      {1 :ahmedkhalf/project.nvim
       :cmd :Telescope
       :config "require'modules.utils.project'"})

    
    ;; Nvim file tree
    ;; see: modules/utils/nvim-tree.fnl for configure nvim-tree
    ;; load when using NvimTreeToggle command 
    (use
      {1 :kyazdani42/nvim-tree.lua
       :cmd :NvimTreeToggle
       :config "require'modules.utils.nvim-tree'"})
    
    ;; Extends TODO comment 
    ;; see: modules/utils/todo-comments.fnl for configure todo-comments
    ;; lead on BufRead
    (use
      {1 :folke/todo-comments.nvim
       :event :BufRead
       :config "require'modules.utils.todo-comments'"}) 

    ;; Markdown previewer
    ;; load when using Glow command
    (use
      {1 :ellisonleao/glow.nvim
       :cmd :Glow})

    ;; UI related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Notification for neovim
    ;; see: modules/ui/notify.fnl for configuration
    (use
      {1 :rcarriga/nvim-notify
       :module :notify
       :config "require'modules.ui.notify'"})

    ;; Startup dashboard
    ;; see: modules/ui/dashboard.fnl for configure dashboard
    ;; TODO: lazy load?
    (use
      {1 :goolord/alpha-nvim
       :after :kanagawa.nvim
       :config "require'modules.ui.dashboard'"})

    ;; Treesitter
    ;; see: modules/ui/treesitter.fnl for configure treesitter
    ;; load on BufRead
    (use
      {1 :nvim-treesitter/nvim-treesitter
       :run :TSUpdate
       :event :BufRead
       :config "require'modules.ui.treesitter'"})

    ;; Rainbow parentheses
    ;; see: modules/ui/nvim-treesitter.fnl for configure nvim-ts-rainbow
    ;; load after nvim-treesitter
    (use
      {1 :p00f/nvim-ts-rainbow
       :after :nvim-treesitter})

    ;; Add underline for same word
    ;; load on BufRead
    (use
      {1 :yamatsum/nvim-cursorline
       :event :BufRead})

    ;; Indent 
    ;; see: modules/ui/indent-blankline.fnl for configure indent-blankline
    ;; load on BufRead
    (use
      {1 :lukas-reineke/indent-blankline.nvim
       :event :BufRead
       :config "require'modules.ui.indent-blankline'"})

    ;; Statusline
    ;; see: modules/ui/statusline.fnl for configure statusline
    ;; load after kanagawa.nvim colorscheme
    (use
      {1 :nvim-lualine/lualine.nvim
       :after :alpha-nvim
       :config "require'modules.ui.statusline'"})


    ;; Bufferline
    ;; see: modules/ui/bufferline.fnl for configure bufferline
    ;; load on BufReadPre
    (use
      {1 :akinsho/bufferline.nvim
       :event :BufReadPre
       :config "require'modules.ui.bufferline'"})

    ;; Theme
    ;; see: modules/ui/themes.fnl for configure themes
    (use
      {1 :rebelot/kanagawa.nvim
       :after :hotpot.nvim
       :config "require'modules.ui.themes'"})

    ;; Zen mode
    ;; load when using ZenMode command 
    ;; see:modules/ui/zen-mode.fnl for configure zen-mode
    (use
      {1 :folke/zen-mode.nvim
       :cmd :ZenMode
       :config "require'modules.ui.zen-mode'"})

    ;; Hightlight portion of code with treesitter used by zen-mode
    (use 
      {1 :folke/twilight.nvim
       :cmd [:Twilight]
       :after :zen-mode.nvim})

    ;; Hightlight HEX color
    ;; see: modules/ui/colorizer.fnl for configure nvim-colorizer
    ;; load when using ColorizerToggle command
    (use
      {1 :norcalli/nvim-colorizer.lua
       :cmd :ColorizerToggle})

    ;; Editing related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;S-expression editing make easier
    ;; load only for fennel file
    (use
      {1 :gpanders/nvim-parinfer
       :ft [:fennel]})

    ;; buffer delete without losting window layout
    ;; load when using Bdelete command
    (use
      {1 :famiu/bufdelete.nvim
       :cmd :Bdelete})

    ;; auto comment
    ;; see: modules/editing/kommentary.fnl for configue kommentary
    ;; load when pressing gc key
    (use
      {1 :b3nj5m1n/kommentary
       :keys [:gc]
       :config "require'modules.editing.kommentary'"})

    ;; better escape with fast jk
    ;; see: modules/editing/better-escape.fnl
    ;; load on InsertEnter
    (use
      {1 :max397574/better-escape.nvim
       :event :InsertEnter
       :config "require'modules.editing.better-escape'"})

    ;; Mapping related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; which-key for documenting keymaps
    ;; see: keymaps.fnl
    ;; load on VimEnter
    (use
      {1 :folke/which-key.nvim
       :keys ["!" "\"" "'" ">" "@" "[" "]" "`" "<"
              :<c-w> :<space> :c :d :g :v :y :z]
       :config "require'keymaps'"})))

; sync plugin when first time install tsukivim
(if _G.packer_bootstrap 
   (packer.sync))

