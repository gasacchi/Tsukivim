import cmd from require'modules.builtin'
import startup from require 'packer'

cmd 'packadd packer.nvim'

packages = (use) ->
  -- Package Manager ----------------------------------------------------------
  use 'wbthomason/packer.nvim'                 -- Packer 
  use 'svermeulen/nvim-moonmaker'              -- Moonscript Utility
  -----------------------------------------------------------------------------

  -- LSP & Completion --------------------------------------------------------
  -- use 'neovim/nvim-lspconfig'                  -- LSP config quickstart 
  -- use 'hrsh7th/nvim-compe'                     -- Completion  
  -- use 'onsails/lspkind-nvim' -- LSP kind icons like vscode  TODO: Purescript icon 
  -- use 'kosayoda/nvim-lightbulb' TODO: Fix LSP first 
  -- use 'glepnir/lspsaga.nvim' TODO 
  use { 'neoclide/coc.nvim', branch: 'release' }

  -----------------------------------------------------------------------------

  -- Git ----------------------------------------------------------------------
  use 'TimUntersberger/neogit'                 -- Magit for Neovim 
  use 'lewis6991/gitsigns.nvim'                -- Git Sign 
  use 'f-person/git-blame.nvim'                -- Show Git Blame 
  -----------------------------------------------------------------------------

  -- Utility ------------------------------------------------------------------
  use {                                        -- Fuzzy Finder 
    'nvim-telescope/telescope.nvim',
    requires: {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  } 
  use 'b3nj5m1n/kommentary'                    -- Code Comment 
  use 'phaazon/hop.nvim'                       -- Jump / Hop Motion 
  use 'tpope/vim-surround'                     -- Surround 
  use 'kyazdani42/nvim-tree.lua'               -- File Tree  
  -- use 'lukas-reineke/format.nvim'           -- Format File TODO 
  -- use 'markdown-preview.nvim'               -- Markdown Preview TODO
  -- euclio/vim-markdown-composer
  -- use 'akinsho/nvim-toggleterm.lua'         -- Terminal TODO
  -- Telescope extensions
  -- use 'nvim-telescope/telescope-project.nvim' -- Manage project
  -----------------------------------------------------------------------------
  
  -- UI -----------------------------------------------------------------------
  use 'rktjmp/lush.nvim'                       -- nvim theme maker
  use 'nvim-web-devicons'
  use {
    'glepnir/galaxyline.nvim',
    branch: 'main',
  }
  use {                                        -- Indent Guide
    'lukas-reineke/indent-blankline.nvim',
    branch: 'lua'
  }
  use 'sainnhe/sonokai'                        -- Themes
  use 'liuchengxu/vim-which-key'               -- WhichKey
  use 'glepnir/dashboard-nvim'                 -- Fancy Dashboard
  use 'akinsho/nvim-bufferline.lua'            -- Bufferline 
  use 'norcalli/nvim-colorizer.lua'            -- HEX Colorizer 
  use 'wfxr/minimap.vim'                       -- blazing fast minimap 
  use 'camspiers/animate.vim'               -- Animated TODO
  use 'psliwka/vim-smoothie'                      -- Smooth scrolling
  use 'junegunn/goyo.vim'                      -- Zen Mode 
  -- junegunn/limelight.vim
  -----------------------------------------------------------------------------
  
  -- Language, etc. -----------------------------------------------------------
  use 'sheerun/vim-polyglot'                   -- Polyglot Syntax Highlight
  -- use 'FrigoEU/psc-ide-vim'                    -- Purescript ide
  
  -----------------------------------------------------------------------------
  
startup packages
