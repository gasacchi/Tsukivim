-- Completion Configuration module.
-- @module completion
-- @field function setup 
-- @field function config
local completion = 
  {}


local cmp = require'cmp'
local cmp_format = require'lspkind'.cmp_format

--- Setup function.
-- run before cmp.nvim plugin is loaded
completion.setup = function()
  vim.g.completeopt = 'menu,menuone,noselect'
end

--- Lsp kind custom icon
-- define custom icon for cmp.nvim formatting
-- @see https://github.com/onsails/lspkind-nvim#configuration
local kind_icons = 
  { Text = 'ﭨ'
  , Method = ''
  , Function = ''
  , Constructor = ''
  , Field = ''
  , Variable = ''
  , Class = 'ﴰ'
  , Interface = ''
  , Module = ''
  , Property = 'ﰠ'
  , Unit = ''
  , Value = ''
  , Enum = ''
  , Keyword = ''
  , Snippet = ''
  , Color = ''
  , File = ''
  , Reference = ''
  , Folder = ''
  , EnumMember = ''
  , Constant = ''
  , Struct = ' '
  , Event = ''
  , Operator = ''
  , TypeParameter = ''
  }

--- Setup for cmp.nvim 
-- @field table snippet
-- @field table formatting
-- @field table sources
-- @field table mapping
-- @field table experimental
-- @see https://github.com/hrsh7th/nvim-cmp#setup
local setup =
  {}

setup.snippet =
  { expand = function(args) vim.fn['vsnip#anonymous'](args.body) end
  }

setup.formatting =
  { format = 
      function(entry, vim_item)

        vim_item.menu = vim_item.kind ..
          ({ buffer = ' :: Buffer'
          , nvim_lsp = ' :: LSP'
          , luasnip = ' :: LuaSnip'
          , nvim_lua = ' :: Lua'
          , latex_symbols = ' :: Latex'
          })[entry.source.name]

        vim_item.kind = kind_icons[vim_item.kind]

        return vim_item
      end
      , with_text = false
  , fields = {'kind', 'abbr', 'menu' }
  }

setup.sources = 
  { { name = 'nvim_lsp' }
  , { name = 'vsnip' }
  , { name = 'path' }
  , { name = 'nvim_lua' }
  , { name = 'buffer' }
  }

setup.mapping = 
  { ['<Tab>'] = cmp.mapping.select_next_item()
  , ['<S-Tab>'] = cmp.mapping.select_prev_item()
  , ['<C-Space>'] = cmp.mapping.complete()
  , ['<C-e>'] = cmp.mapping.close()
  , ['<CR>'] = cmp.mapping.confirm 
                  { behavior = cmp.ConfirmBehavior.Replace
                  , select = true
                  }
  }

setup.experimental = 
  { ghost_text = true
  }

--- Config function
-- run after cmp.nvim plugin is loaded
completion.config = function()

  cmp.setup
    { snippet = setup.snippet
    , formatting = setup.formatting 
    , sources = setup.sources
    , mapping = setup.mapping 
    , experimental = setup.experimental
    }

end

return completion

