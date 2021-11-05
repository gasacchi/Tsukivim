vim.cmd'packadd packer.nvim'

-- (): already using lua
return require'packer'.startup(function(use)
  -- Package Manager ----------------------------------------------------------
  use 'wbthomason/packer.nvim'                 -- Plugin Manager 
  -----------------------------------------------------------------------------

  -- LSP & Completion --------------------------------------------------------
  use 'neovim/nvim-lspconfig'                  -- Config quickstart 

  use 'onsails/lspkind-nvim'                   -- LSP kind icons like vscode 
  use {                                        -- nvim cmp
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-buffer",
    }
  }

  use 'kosayoda/nvim-lightbulb'                -- Lightbulb 
  use 'folke/trouble.nvim'                     -- Pretty Diagnostics
  -- NOTE: will use for until glepnir come back
  -- use 'glepnir/lspsaga.nvim'                   -- LSP UI 
  use { 'tami5/lspsaga.nvim', branch = 'nvim51' }
  -----------------------------------------------------------------------------

  -- Git ----------------------------------------------------------------------
  use 'TimUntersberger/neogit'                 -- Magit for Neovim 
  use 'lewis6991/gitsigns.nvim'                -- Git Sign 
  use 'f-person/git-blame.nvim'                -- Show Git Blame 
  use 'kdheepak/lazygit.nvim'                  -- Lazygit wrapper
  -----------------------------------------------------------------------------
  
  -- Editing ------------------------------------------------------------------
  use 'b3nj5m1n/kommentary'                    -- Code Comment 
  use 'tpope/vim-surround'                     -- Surround
  use 'phaazon/hop.nvim'                       -- Jump / Hop Motion 
  -- use 'vhyrro/neorg'                           -- Org mode in neovim
  -----------------------------------------------------------------------------

  -- Utility ------------------------------------------------------------------
  use {                                        -- Fuzzy Finder 
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    }
  }
  use {                                        -- file explorer
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use 'folke/todo-comments.nvim'               -- PERF utile
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
  use 'glepnir/dashboard-nvim'                 -- Fancy Dashboard
  use 'akinsho/nvim-bufferline.lua'            -- Bufferline 
  use 'norcalli/nvim-colorizer.lua'            -- HEX Colorizer 
  use 'wfxr/minimap.vim'                       -- blazing fast minimap
  use 'camspiers/animate.vim'                  -- Animated
  use 'psliwka/vim-smoothie'                   -- Smooth scrolling
  use 'junegunn/goyo.vim'                      -- Zen Mode
  -----------------------------------------------------------------------------

  -- Language, etc. -----------------------------------------------------------
  use 'sheerun/vim-polyglot'                   -- Polyglot Syntax Highlight
  -----------------------------------------------------------------------------
  end)
