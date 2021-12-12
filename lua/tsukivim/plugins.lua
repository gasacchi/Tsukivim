--- Plugins module
-- @module plugins

vim.cmd[[packadd packer.nvim]]

-- TODO: clipboard doesn't work (wayland)

-- TODO: use bootstrap snippet from packer repo for automatic install packer when not installed
-- TODO: broken when first install
return require'packer'.startup (function(use)
  -- Package Manager ----------------------------------------------------------
  use 'wbthomason/packer.nvim'
  -----------------------------------------------------------------------------


  -- LSP & Completion --------------------------------------------------------
  -- Neovim builtin LSP
  -- TODO: config
  use                                        
    { 'neovim/nvim-lspconfig'               
    , config = require'modules.lsp'.config()
    }

  -- Fancy Pmenu completion with icon and details
  use                                         
    { 'onsails/lspkind-nvim'                   
    }
  
  -- Code completions and snippets
  use 
    { "hrsh7th/nvim-cmp"
    , requires = 
      { "hrsh7th/cmp-nvim-lsp"
      , "hrsh7th/cmp-vsnip"
      , "hrsh7th/vim-vsnip"
      , "hrsh7th/cmp-buffer"
      , "hrsh7th/cmp-path"
      , "hrsh7th/cmp-nvim-lua"
      }
    , setup = require'modules.lsp.completion'.setup()
    , config = require'modules.lsp.completion'.config()
    }

  --[[ -- Lightbult when there is code-action
  use 
    { 'kosayoda/nvim-lightbulb'
    } ]]

  -- Pretty diagnostic list
  -- TODO: configuration
  use
    { 'folke/trouble.nvim'
    , config = require'modules.lsp.trouble'.config()
    }

  -- LSP plugin with UI
  -- TODO: configuration
  use 
    { 'tami5/lspsaga.nvim'
    , config = require'modules.lsp.lspsaga'.config()
    }
  
  -----------------------------------------------------------------------------


  -- Git ----------------------------------------------------------------------
  -- Magit clone for neovim
  use 
    { 'TimUntersberger/neogit'
    , config = require'modules.git.neogit'.config()
    }

  -- Git integrations: signs, hunk, etc
  use 
    { 'lewis6991/gitsigns.nvim'
    , config = require'modules.git.gitsigns'.config()
    }

  -----------------------------------------------------------------------------


  -- Editing ------------------------------------------------------------------
  -- Comment plugin for neovim
  use 
    { 'b3nj5m1n/kommentary'                   
    , config = require'modules.editing.kommentary'.config()
    }

  -- Surrond object
  -- TODO: configuration
  use 
    { 'tpope/vim-surround'
    }

  -- Fast moving
  use 
    { 'phaazon/hop.nvim'
    , config = require'modules.editing.hop'.config()
    }

  -----------------------------------------------------------------------------


  -- Utility ------------------------------------------------------------------
  -- Fuzzy finder
  -- TODO: configuration
  use 
    { 'nvim-telescope/telescope.nvim'
    ,requires = 
      { {'nvim-lua/popup.nvim'}
      , {'nvim-lua/plenary.nvim'}
      }
    , config = require'modules.utils.telescope'.config()
    }

  -- Telescope fzf native for speed
  use 
    { 'nvim-telescope/telescope-fzf-native.nvim'
    , run = 'make'
    , config = require'modules.utils.telescope'.native_config()
    }

  -- File tree explorer
  -- TODO: configuration
  use 
    { 'kyazdani42/nvim-tree.lua'
    , requires = 'kyazdani42/nvim-web-devicons'
    , config = require'modules.utils.nvimtree'.config()
  }

  -- Extends todo comment
  -- TODO: configuration
  use 
    { 'folke/todo-comments.nvim'
    , config = require'modules.utils.todo-comments'.config()
    }

  -- Use terminal in neovim
  -- TODO: configuration
  use 
    { 'akinsho/toggleterm.nvim'
    , config = require'modules.utils.toggleterm'.config()
    }

  -----------------------------------------------------------------------------


  -- UI -----------------------------------------------------------------------
  -- Treesitter
  -- TODO: configuration
  use 
    { 'nvim-treesitter/nvim-treesitter'
    , config = require'modules.ui.treesitter'.config()
    }

  -- Whichkey for better navigation info
  -- TODO: configuration
  use 
    { 'folke/which-key.nvim'
    , config = require'modules.ui.whichkey'.config()
    }

  -- Icons pack
  use 
    { 'kyazdani42/nvim-web-devicons'
    }

  -- Hightlight line and word
  -- TODO: configuration
  use 
    { 'yamatsum/nvim-cursorline'
    }

  -- Indent plugin
  -- TODO: configuration
  use 
    { 'lukas-reineke/indent-blankline.nvim'
    , config = require'modules.ui.indentblankline'.config()
    }

  -- Statusline
  -- TODO: configuration
  use 
    { 'nvim-lualine/lualine.nvim'
    , config = require'modules.ui.statusline'.config()
    }

  -- Theme
  -- TODO: configuration
  use 
    { 'projekt0n/github-nvim-theme'
    , config = require'modules.ui.colorscheme'.config()
    }

  -- Startup dashboard
  -- TODO: configuration
  use 
    { 'glepnir/dashboard-nvim'
    , config = require'modules.ui.dashboard'.config()
    }
  
  -- Bufferline and Tabline
  -- TODO: configuration
  use 
    { 'akinsho/bufferline.nvim'
    , config = require'modules.ui.bufferline'.config()
    }

  -- Hightlight HEX color
  -- TODO: configuration
  use 
    { 'norcalli/nvim-colorizer.lua'
    , config = require'modules.ui.colorizer'.config()
    }

  -- Code minimap
  -- TODO: configuration
  use 
    { 'wfxr/minimap.vim'
    , config = require'modules.ui.minimap'.config()
    }

  -- Neovim fancy notification
  -- TODO: configuration
  use 
    { 'rcarriga/nvim-notify'
    }

  -----------------------------------------------------------------------------


  -- Language, etc. -----------------------------------------------------------
  -- vim syntax hightlighting
  use 
    { 'sheerun/vim-polyglot'
    , setup = require'modules.languages.polyglot'.setup()
    }

  -----------------------------------------------------------------------------

  end
)

