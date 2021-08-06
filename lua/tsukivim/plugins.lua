vim.cmd'packadd packer.nvim'


-- (): already using lua
return require'packer'.startup(function(use)
  -- Package Manager ----------------------------------------------------------
  use 'wbthomason/packer.nvim'                 -- Plugin Manager 
  -----------------------------------------------------------------------------

  -- LSP & Completion --------------------------------------------------------
  use 'neovim/nvim-lspconfig'                  -- Config quickstart 
  use 'kabouzeid/nvim-lspinstall'              -- Installer 
  use 'hrsh7th/nvim-compe'                     -- Completion 
  use 'onsails/lspkind-nvim'                   -- LSP kind icons like vscode 
  use 'kosayoda/nvim-lightbulb'                -- Lightbulb 
  use 'folke/trouble.nvim'                     -- Pretty Diagnostics
  use 'glepnir/lspsaga.nvim'                   -- LSP UI 
  -----------------------------------------------------------------------------

  -- Git ----------------------------------------------------------------------
  use 'TimUntersberger/neogit'                 -- Magit for Neovim 
  use 'lewis6991/gitsigns.nvim'                -- Git Sign 
  use 'f-person/git-blame.nvim'                -- Show Git Blame 
  -----------------------------------------------------------------------------

  -- Utility ------------------------------------------------------------------
  use {                                        -- Fuzzy Finder 
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    }
  }
  use 'kdheepak/lazygit.nvim'                  -- Lazygit wrapper
  use 'b3nj5m1n/kommentary'                    -- Code Comment 
  use 'phaazon/hop.nvim'                       -- Jump / Hop Motion 
  use 'tpope/vim-surround'                     -- Surround
  use 'kyazdani42/nvim-tree.lua'               -- File Tree  
  use 'folke/todo-comments.nvim'               -- PERF utile
  --[[ use {
    'abecodes/tabout.nvim',
    wants = {'nvim-treesitter'}, -- or require if not used so far
    after = {'nvim-compe'} -- if a completion plugin is using tabs load it before
  }                   -- tab escape from () etc ]]
  -- use 'kevinhwang91/nvim-hlslens'              -- extends search (/)
  -- use ''                           -- neovim snippet
  -- use 'vhyrro/neorg'                           -- Org mode in neovim
  -- use 'markdown-preview.nvim'               -- Markdown Preview
  -- euclio/vim-markdown-composer
  -- Telescope extensions
  -- use 'nvim-telescope/telescope-project.nvim' -- Manage project
  -----------------------------------------------------------------------------

  -- UI -----------------------------------------------------------------------
  use 'nvim-treesitter/nvim-treesitter'
  use 'folke/which-key.nvim'                   -- alt whichkey
  use 'kyazdani42/nvim-web-devicons'
  use 'yamatsum/nvim-cursorline'               -- cursorline
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main'
  }
  use {                                        -- Indent Guide
    'lukas-reineke/indent-blankline.nvim',
    -- branch = 'lua'
  }
  use 'folke/tokyonight.nvim'
  use 'liuchengxu/vim-which-key'               -- WhichKey
  use 'glepnir/dashboard-nvim'                 -- Fancy Dashboard
  use 'akinsho/nvim-bufferline.lua'            -- Bufferline 
  use 'norcalli/nvim-colorizer.lua'            -- HEX Colorizer 
  use 'wfxr/minimap.vim'                       -- blazing fast minimap
  use 'camspiers/animate.vim'                  -- Animated
  use 'psliwka/vim-smoothie'                   -- Smooth scrolling
  -- use 'karb94/neoscroll.nvim'                  -- smooth scrolling in lua
  use 'junegunn/goyo.vim'                      -- Zen Mode
  -- use 'Pocco81/TrueZen.nvim'                   -- Zen Mode written in lua
  -- junegunn/limelight.vim
  -----------------------------------------------------------------------------

  -- Language, etc. -----------------------------------------------------------
  use 'sheerun/vim-polyglot'                   -- Polyglot Syntax Highlight
  -- use 'frigoeu/psc-ide-vim'
  -----------------------------------------------------------------------------
  end)
