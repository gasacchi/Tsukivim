;; Module configure packer.nvim for installing plugin 
(local packer (require :packer))
(local packer-utils (require :packer.util))

;; Packer settings
(packer.init 
  {:display 
   {:open_fn (lambda []
              (packer-utils.float {:border :single}))
    :prompt_border :single
    :profile {:enable true :threshold 0}}})

;; Packer plugin declarations
(packer.startup
  (fn [use]
    "Packer use this declaration to compile to ../plugin/packer_compiled.lua
     then install to ~/.local/share/nvim/site/pack/packer/start/ or 
     ~/local/share/nvim/site/pack/packer/opt/ if the plugin flagged as `opt`"

    ;; Core plugins for managing plugin and fennel in Tsukivim ;;;;;;;;;;;;;;;;;
    ;; Packer plugin manager
     (use 
       (doto [:wbthomason/packer.nvim]
             (tset :opt true)))

    ;; Fennel integrations in neovim
    ;; see: ../init.lua:37 for adding fennel configuration
     (use 
       (doto [:rktjmp/hotpot.nvim]
             (tset :event :VimEnter)))

     ;; Essential for some plugins
     (use 
       (doto [:nvim-lua/plenary.nvim]
             (tset :module :plenary)))
     
     ;; Create neovim ui
     (use 
       (doto [:MunifTanjim/nui.nvim]
             (tset :module :nui)))
     
     ;; For fancy icon
     (use 
       (doto [:kyazdani42/nvim-web-devicons]
             (tset :module :nvim-web-devicons)))

     ;; Replacement for filetypes.vim faster load
     (use :nathom/filetype.nvim)

    ;; LSP related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Neovim built-in LSP
    ;; see: modules/lsp/init.fnl for configure nvim-lspconfig
    ;; load on BufReadPre
     (use 
       (doto [:neovim/nvim-lspconfig]
             (tset :event :BufReadPre)
             (tset :config "require'modules.lspconfig.config'")))

    ;; Neovim code completions
    ;; see: modules/lsp/completion.fnl for configure cmp.nvim
     (use
       (doto [:hrsh7th/nvim-cmp]
             (tset :event :InsertEnter)
             (tset :config "require'modules.cmp.config'")
             (tset :requires [(doto [:hrsh7th/cmp-nvim-lsp]
                                    (tset :module :cmp_nvim_lsp))
                              (doto [:hrsh7th/cmp-vsnip]
                                    (tset :after :nvim-cmp))
                              (doto [:hrsh7th/vim-vsnip]
                                    (tset :after :cmp-vsnip))
                              (doto [:hrsh7th/cmp-buffer]
                                    (tset :after :cmp-vsnip))])))
                              ;; (doto [:rafamadriz/friendly-snippets]
                              ;;       (tset :after :nvim-cmp))])))

    ;; Pretty diagnostic list
    ;; see: modules/lsp/trouble.fnl for configure trouble.nvim
    ;; load when using Trouble / TroubleToggle command 
     (use 
       (doto [:folke/trouble.nvim]
             ;; (tset :after :nvim-lspconfig)
             (tset :module :trouble)
             (tset :cmd [:Trouble])
             (tset :config "require'modules.trouble.config'")))

    ;; LSP UI
    ;; see: modules/lsp/saga.fnl for configure lspsaga
    ;; load on BufRead
    (use 
      (doto [:tami5/lspsaga.nvim]
            (tset :event :BufRead)
            (tset :config "require'modules.lspsaga.config'")))
     
    ;; Programming language related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Fennel
    ;; load only for fennel file
    (use 
      (doto [:bakpakin/fennel.vim]
            (tset :ft :fennel)))
    
    ;; Lua
    ;; load only for lua file
    (use 
      (doto [:tbastos/vim-lua]
            (tset :ft :lua)))

    ;; Rust
    ;; load only for rust file
    (use
      (doto [:rust-lang/rust.vim]
            (tset :ft :rust)))
    
    ;; Html
    ;; load only for html file
    (use 
      (doto [:othree/html5.vim]
            (tset :ft :html)))
    
    ;; Json
    ;; load only for json file
    (use
      (doto [:elzr/vim-json]
            (tset :ft :json)))

    ;; toml
    ;; load only for toml file
    (use 
      (doto [:cespare/vim-toml]
            (tset :ft :toml)))
    
    ;; Javascript
    ;; load only for javascript file
    (use 
      (doto [:pangloss/vim-javascript]
            (tset :ft :javascript)))

    ;; Typescript
    ;;load only for typescript file
    (use 
      (doto [:HerringtonDarkholme/yats.vim]
            (tset :ft :typescript)))

    ;; Svelte
    ;; load only for svelte file
    (use
      (doto [:evanleck/vim-svelte]
            (tset :ft :svelte)))

    ;; Markdown
    ;; load only for markdown file
    (use
      (doto [:plasticboy/vim-markdown]
            (tset :ft :markdown)))

    ;; Fish
    ;; load only for fish file
    (use 
      (doto [:blankname/vim-fish]
            (tset :ft :fish)))
    
    ;; Sh/Bash
    ;; load only for sh / bash file
    (use 
      (doto [:arzg/vim-sh]
            (tset :ft [:sh :bash])))

    ;; Swayconfig
    ;; load only for swayconfig file
    (use 
      (doto [:jamespeapen/swayconfig.vim]
            (tset :ft :swayconfig)))
    
    ;; Git related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Magit port for neovim
    ;; see: modules/git/neogit.fnl for configure neogit
    ;; load when using Neogit command 
    (use 
      (doto [:TimUntersberger/neogit]
            (tset :cmd :Neogit)
            (tset :config "require'modules.neogit.config'")))

    ;; Git signs
    ;; see: modules/git/gitsigns.fnl for configure gitsigns
    ;; load on BufReadPre
    (use
      (doto [:lewis6991/gitsigns.nvim]
            ;; (tset :event :BufReadPre)
            (tset :module :gitsigns)
            (tset :config "require'modules.gitsigns.config'")))

    ;; Utility related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Telescope Fuzzy finder
    ;; see: modules/utils/telescope.fnl for configure telescope
    ;; load when using Telescope command 
    (use 
      (doto [:nvim-telescope/telescope.nvim]
            (tset :module :telescope)
            (tset :config "require'modules.telescope.config'")
            (tset :requires 
                  [(doto [:nvim-telescope/telescope-fzf-native.nvim]
                         (tset :opt true)
                         (tset :run :make))
                   (doto [:nvim-telescope/telescope-project.nvim]
                         (tset :opt true))])))
    
    ;; Nvim file tree
    ;; see: modules/utils/nvim-tree.fnl for configure nvim-tree
    ;; load when using NvimTreeToggle command 
    (use 
      (doto [:kyazdani42/nvim-tree.lua]
            (tset :cmd :NvimTreeToggle)
            (tset :config "require'modules.nvim-tree.config'")))
    
    ;; Extends todo comment 
    ;; see: modules/utils/todo-comments.fnl for configure todo-comments
    ;; lead on BufRead
    (use
      (doto [:folke/todo-comments.nvim]
            (tset :event :BufRead)
            (tset :config "require'modules.todo-comments.config'")))

    ;; Markdown previewer
    ;; load when using Glow command
    (use
      (doto [:ellisonleao/glow.nvim]
            (tset :cmd :Glow)))

    ;; UI related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Theme
    ;; see: modules/ui/themes.fnl for configure themes
    (use 
      (doto [:rebelot/kanagawa.nvim]
            (tset :after :hotpot.nvim)
            (tset :config "require'modules.themes.config'")))

    ;; Notification for neovim
    ;; see: modules/ui/notify.fnl for configuration
    (use 
      (doto [:rcarriga/nvim-notify]
            (tset :module :notify)
            (tset :config "require'modules.notify.config'")))

    ;; Startup dashboard
    ;; see: modules/ui/dashboard.fnl for configure dashboard
    (use
      (doto [:goolord/alpha-nvim]
            (tset :after :kanagawa.nvim)
            (tset :config "require'modules.alpha-dashboard.config'")))

    ;; Treesitter
    ;; see: modules/ui/treesitter.fnl for configure treesitter
    ;; load on BufRead
    (use
      (doto [:nvim-treesitter/nvim-treesitter]
            (tset :run :TSUpdate)
            (tset :event :BufRead)
            (tset :config "require'modules.treesitter.config'")
            (tset :requires 
                  ;; Rainbow parentheses
                  [(doto [:p00f/nvim-ts-rainbow]
                         (tset :after :nvim-treesitter))])))

    ;; Add underline for same word
    ;; TODO: config
    ;; (use 
    ;;   (doto [:RRethy/vim-illuminate]
    ;;         (tset :opt true)))

    ;; Indent 
    ;; see: modules/ui/indent-blankline.fnl for configure indent-blankline
    ;; load on BufRead
    (use
      (doto [:lukas-reineke/indent-blankline.nvim]
            (tset :event :BufRead)
            (tset :config "require'modules.indent-blankline.config'")))

    ;; Statusline
    ;; see: modules/ui/statusline.fnl for configure statusline
    ;; load after kanagawa.nvim colorscheme
    (use 
      (doto [:nvim-lualine/lualine.nvim]
            (tset :after :alpha-nvim)
            (tset :config "require'modules.lualine.config'")))


    ;; Bufferline
    ;; see: modules/ui/bufferline.fnl for configure bufferline
    ;; load on BufReadPre
    (use 
      (doto [:akinsho/bufferline.nvim]
            (tset :event :BufReadPre)
            (tset :config "require'modules.bufferline.config'")
            (tset :requires 
                  ;; Buffer delete without losing window layout
                  [(doto [:famiu/bufdelete.nvim] 
                         (tset :cmd :Bdelete))])))

    ;; Zen mode
    ;; see:modules/ui/zen-mode/config.fnl for configure zen-mode
    (use 
      (doto [:folke/zen-mode.nvim]
            (tset :cmd :ZenMode)
            (tset :config "require'modules.zen-mode.config'")
            (tset :requires 
                  ;; Hightlight portion of code with treesitter used by zen-mode
                  [(doto [:folke/twilight.nvim]
                         (tset :cmd [:Twilight])
                         (tset :after :zen-mode.nvim))])))

    ;; Hightlight HEX color
    (use 
      (doto [:norcalli/nvim-colorizer.lua]
            (tset :cmd :ColorizerToggle)))

    ;; Editing related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;S-expression editing make easier
    (use 
      (doto [:gpanders/nvim-parinfer]
            (tset :ft [:fennel])))

    ;; auto comment
    ;; see: modules/editing/comment/config.fnl
    (use 
      (doto [:numToStr/Comment.nvim]
            (tset :keys [:gc :gcc :gbc]);
            (tset :config "require'modules.comment.config'")))

    ;; better escape with fast jk
    ;; see: modules/editing/better-escape/config.fnl
    (use 
      (doto [:max397574/better-escape.nvim]
            (tset :event :InsertEnter)
            (tset :config "require'modules.better-escape.config'")))

    ;; hop / jump 
    ;; see: modules/editing/hop/config.fnl
    (use 
      (doto [:phaazon/hop.nvim]
            (tset :module :hop)
            (tset :config "require'modules.hop.config'")))

    ;; Mapping related plugins ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; which-key for documenting keymaps
    ;; see: keymaps.fnl
    (use 
      (doto [:folke/which-key.nvim]
            (tset :module :which-key)
            (tset :keys ["!" "\"" "'" ">" "@" "[" "]" "`" "<"
                         :<c-w> :<space> :c :d :g :v :y :z])
            (tset :config "require'modules.keymaps.config'")))))

; sync plugin when first time install tsukivim
(if _G.packer_bootstrap 
   (packer.sync))
