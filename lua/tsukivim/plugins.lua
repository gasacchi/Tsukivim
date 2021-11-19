vim.cmd'packadd packer.nvim'

return require'packer'.startup(function(use)
  -- Package Manager ----------------------------------------------------------
  use 'wbthomason/packer.nvim'                 -- Plugin Manager
  -----------------------------------------------------------------------------


  -- LSP & Completion --------------------------------------------------------
  use 'neovim/nvim-lspconfig'                  -- Config quickstart
  use 'onsails/lspkind-nvim'                   -- LSP kind icons like vscode
  use {                                        -- nvim completion
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua"
    }
  }
  use 'kosayoda/nvim-lightbulb'                -- Lightbulb
  use 'folke/trouble.nvim'                     -- Pretty Diagnostics
  use { 'tami5/lspsaga.nvim', branch = 'nvim51' }
  -----------------------------------------------------------------------------


  -- Git ----------------------------------------------------------------------
  use 'TimUntersberger/neogit'                 -- Magit for Neovim
  use 'lewis6991/gitsigns.nvim'                -- Git Sign
  use 'f-person/git-blame.nvim'                -- Show Git Blame
  -----------------------------------------------------------------------------


  -- Editing ------------------------------------------------------------------
  use 'b3nj5m1n/kommentary'                    -- Code Comment 
  use 'tpope/vim-surround'                     -- Surround
  use 'phaazon/hop.nvim'                       -- Jump / Hop Motion
  -----------------------------------------------------------------------------


  -- Utility ------------------------------------------------------------------
  use {                                        -- Fuzzy Finder
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {                                        -- file explorer
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use 'folke/todo-comments.nvim'               -- Todo Comment
  use 'akinsho/toggleterm.nvim'
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
  use 'lukas-reineke/indent-blankline.nvim'    -- Indent Guide
  use 'folke/tokyonight.nvim'
  use 'glepnir/dashboard-nvim'                 -- Fancy Dashboard
  -- use 'goolord/alpha-nvim'                  -- Fancy Dashboard
  use 'akinsho/bufferline.nvim'                -- Bufferline
  use 'norcalli/nvim-colorizer.lua'            -- HEX Colorizer
  -----------------------------------------------------------------------------


  -- Language, etc. -----------------------------------------------------------
  use 'sheerun/vim-polyglot'                   -- Polyglot Syntax Highlight
  -----------------------------------------------------------------------------
  end)
