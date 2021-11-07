---------------------------------------------------------------------------
-- Mappings
-- ----------------------------------------------------------------------------

local keymap = vim.api.nvim_set_keymap 
local setvar = vim.api.nvim_set_var
local cmd = vim.cmd

local opts = {
  noremap = true,
}


-- Disable Arrow keys
keymap("i", "<DOWN>", "<NOP>", opts)
keymap("i", "<LEFT>", "<NOP>", opts)
keymap("i", "<RIGHt>","<NOP>", opts)
keymap("i", "<UP>",   "<NOP>", opts)
keymap("n", "<DOWN>", "<NOP>", opts)
keymap("n", "<LEFT>", "<NOP>", opts)
keymap("n", "<RIGHt>","<NOP>", opts)
keymap("n", "<UP>",   "<NOP>", opts)

-- Esc to jk
keymap("i", "jk","<ESC>", opts)
-- Escape from command mode with jk
keymap("c", "jk","<C-c>", opts)
-- Use Y to yank from current cursor to end of a line
keymap("n", "Y", "y$", opts )
-- consistent jump in middle
keymap("n", "n", "nzz", opts )
keymap("n", "N", "Nzz", opts )


-- Terminal map
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-t>n', [[<C-\><C-n>:tabnext<cr>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-t>p', [[<C-\><C-n>:tabnext<cr>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-t>p', [[<C-\><C-n>:tabnext<cr>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


-- Map q to exit help
cmd "autocmd FileType help noremap <buffer> q :close<CR>"
-- Map q to exit Dashboard
cmd "autocmd FileType dashboard noremap <buffer> q :q<CR>"
-- for quikfix
cmd "autocmd FileType qf noremap <buffer> q :q<CR>"

-- require which-key default config
vim.g.timeoutlen = 500
keymap("n", " ", ":WhichKey <leader><cr>", opts )
require'modules.ui.whichkey'

-- print function
local function cmdp(c,message)
  return string.format("%s<cr>:echohl Error | echon '  ' | echohl String | echon '|>' | echohl Boolean | echon ' %s' | echohl None<cr>", c, message)
end

-- set keybind
local wk = require'which-key'

local map = {}

-- Single Mappings
map[" "] = { "<Esc>",                          " Close"                      }
map["."] = { ":Telescope file_browser<cr>",      " Find File"                  }
map.Q    = { ":q!<cr>",                        " Quit Without Saving"        }
map.q    = { ":q<cr>",                         " Quit"                       }

-- Action TODO: add action keymap
map.a    = {
  name   =                                     "省Actions",
  [" "]  = { "<Esc>",                          " Close"                     },
  r      = { cmdp(":LspRestart",               "Lsp Restarted"),
  "Restart Lsp"          },
  s      = { cmdp(":LspStart",                 "Lsp Started"),
  "Start Lsp"          },
  S      = { cmdp(":LspStop",                  "Lsp Stoped"),
  "Stop Lsp"          },
  p      = { cmdp('"+p',                       "Paste.."),
  "Paste from clipboard"          },
  c      = { cmdp('"+y',                       "Copy.."),
  "Copy to clipboard"          },
}

-- Buffers Mappings
map.b    = {
  name   =                                     " Buffers",
  [" "]  = { "<Esc>",                          " Close"                 },
  b      = { ":Telescope buffers<cr>",         " First buffer"          },
  d      = { cmdp(":bdelete %", "Buffer deleted"),
  " Delete current buffer"                                   },
  f      = { cmdp(":bfirst", "Move to first buffer"),
  " First buffer"                                            },
  l      = { cmdp(":blast", "Move to last buffer"),
  " Last buffer"                                             },
  n      = { cmdp(":BufferLineCycleNext", "Move to next buffer"),
  " Next buffer"                                             },
  p      = { cmdp(":BufferLineCyclePrev", "Move to previous buffer"),
  " Previous buffer"                                         },
}

-- Editors
map.e    =  {
  name   =                                     " Editors",
  [" "]  = { "<Esc>",                          " Close"              },
  e      = { cmdp(":luafile %", "Current file evaluated"),
  "省Eval current file"  },
  E      = { cmdp(":luafile $MYVIMRC", "Init.lua evaluated"),
  "省Eval init.lua"      },
  h      = { cmdp(":let @/ = ''", "highlight search off"),
  " No highlight search"},
  n      = { cmdp(":set invnumber", "Toggle number line"),
  " Line number"        },
  r      = { cmdp(":set invrelativenumber", "Toggle relative line"),
  " Line number"        },
}

-- Files
map.f    = {
  name   =                                            " Files",
  [" "]  = { "<Esc>",                                 " Close" },
  e      = { ":e ",                                   " Edit file(s)" },
  S      = { ":wq<cr>",                               " Save and exit" },
  n      = { ":DashboardNewFile<cr>",                 " New file" },
  s      = { cmdp(":w", "File saved"),                                " Save file" },
}

map.g    = {
  name   =                                                   " Git",
  [" "]  = { "<Esc>",                                        " Close"          },
  g      = { ":lua require'neogit'.open{kind='split'}<cr>",  " Neogit"         },
  c      = { ":Neogit commit<cr>",                           " Commit"         },

  -- Mapping from gitsigns
  s      =                                                   " Stage hunk",
  u      =                                                   " Unstage hunk",
  R      =                                                   "﬘ Reset buffer",
  r      =                                                   "痢Reset hunk",
  P      =                                                   " Preview hunk",
  b      =                                                   " Blame line",
  p      =                                                   "玲Previous hunk",
  n      =                                                   "怜Next hunk",
}

-- Help
map.h    = {
  name   =                                            " Help",
  [" "]  = { "<Esc>",                                 " Close"              },
  H      = { ":Telescope highlights<cr>",             " Highlights"         },
  h      = { ":Telescope help_tags<cr>",              " Help tags"          },
  m      = { ":Telescope man_pages<cr>",              "龎 Manual pages"      },
}


-- LSP
map.l    = {
  name   =                                        " LSP",
  [" "]  = { "<Esc>",                             " Close"                  },
  ["."]  =                                        " Lsp finder Ref & Def",
  h      =                                        " Hover documentation",
  H      =                                        " Help",
  n      =                                        "怜Diagnostics next",
  p      =                                        "玲Diagnostics prev",
  d      =                                        " Definitions",
  D      =                                        " Declaration",
  t      =                                        " Type definitions",
  i      =                                        " Implementation",
  R      =                                        "凜Rename",
  f      =                                        " Format",
  a      =                                        " Code action",
  x      =                                        " Show line diagnostics",
  X      =                                        "_ Show cursor diagnostics",
  w      = {
    name   =                                      "華Workspace action",
    [" "]  = { "<Esc>",                           " Close"                  },
    a    =                                        " Add workspace folder",
    r    =                                        "凜Remove workspace folder",
    l    =                                        " List workspace",
  },
}


map.m    = {
  name   =                                        "省Motion",
  [" "]  = { "<Esc>",                             " Close"                  },
  w      = { ":HopWord<cr>",                      " Hop word"               },
  p      = { ":HopPattern<cr>",                   " Hop pattern"            },
  l      = { ":HopLine<cr>",                      " Hop line"               },
  c      = { ":HopChar1<cr>",                     " Hop char 1"             },
  C      = { ":HopChar2<cr>",                     "了Hop char 2"             },
}

-- Open
map.o    = {
  name   =                                            "冷Open",
  [" "]  = { "<Esc>",                                 " Close"              },
  e      = { cmdp(":NvimTreeToggle", "Open file explorer"),
             "滑Tree"               },
  m      = { cmdp(":GonvimMiniMap", "Open minimap"),
             " Minimap"            },
  M      = { cmdp(":GonvimMarkdown", "Open markdown"),
             " Markdown"            },
  t      = { ":ToggleTerm dir=git_dir<cr>", " Terminal"            },
  T      = { ":ToggleTerm dir=git_dir direction=tab <cr>", " Terminal"            },
}

-- packer plugin manager
map.p    = {
  name   =                                            " Plugin",
  [" "]  = { "<Esc>",                                 " Close" },
  C      = { cmdp(":PackerClean", "Plugin cleaned"),
             "﯊Clean" },
  c      = { cmdp(":PackerCompile", "Plugin compiled"),
             " Compile" },
  i      = { cmdp(":PackerInstall", "Plugin install"),
             " Install" },
  s      = { cmdp(":PackerSync", "Sync Plugin"),
             "痢Sync" },
  u      = { cmdp(":PackerUpdate", "Update Plugin"),
             " Update" },
}

-- Search with Telescope
map.s    = {
  name   = " Search",
  [" "]  = { "<Esc>",                              " Close"                     },
  ["."]  = { ":Telescope live_grep<cr>",           " Grep in current directory" },
  ["'"]  = { ":Telescope grep_string<cr>",         " Grep string ."             },
  [";"]  = { ":Telescope filetypes<cr>",           " Filetypes"                 },
  [","]  = { ":Telescope colorscheme<cr>",         " Colorschemes"              },
  ["?"]  = { ":TodoTelescope<cr>",                 " TODO"                      },
  b      = { ":Telescope buffers<cr>",             "﬘ Buffers"                   },
  B      = { ":Telescope builtin<cr>",             " Builtins"                  },
  c      = { ":Telescope commands<cr>",            " Commands"                  },
  C      = { ":Telescope command_history<cr>",     " Commands history"          },
  a      = { ":Telescope autocommands<cr>",        " Autocommands"              },
  f      = { ":Telescope find_files<cr>",          " Find file"                 },
  F      = { ":Telescope file_browser<cr>",        " File browser"              },
  g      = {
    [" "]= { "<Esc>",                              " Close"                     },
    name = " Git",
    g    = { ":Telescope git_files<cr>",           " Files"                     },
    c    = { ":Telescope git_commits<cr>",         " Commits"                   },
    C    = { ":Telescope git_bcommits<cr>",        " Buffer commits"            },
    b    = { ":Telescope git_branches<cr>",        " Branches"                  },
    s    = { ":Telescope git_status<cr>",          " Status"                    },
  },
  h      = { ":Telescope oldfiles<cr>",            " History"                   },
  k      = { ":Telescope keymaps<cr>",             " Keymaps"                   },
  l      = {
    name = " LSP",
    [" "]= { "<Esc>",                                     " Close"              },
    ["."]= { ":Telescope lsp_definitions<cr>",            " Definitions"        },
    r    = { ":Telescope lsp_references<cr>",             " References"         },
    d    = { ":Telescope lsp_document_symbols<cr>",       " Document symbols"   },
    w    = { ":Telescope lsp_workspace_symbols<cr>",      "華Workspace symbols"  },
    a    = { ":Telescope lsp_code_actions<cr>",           " Code actions"       },
    R    = { ":Telescope lsp_range_code_actions<cr>",     " Range actions"      },
    D    = { ":Telescope lsp_document_diagnostics<cr>",   " Document diagnostics" },
    W    = { ":Telescope lsp_workspace_diagnostics<cr>",  " Workspace diagnostics"},
  },
  m      = { ":Telescope marks<cr>",                      " Marks"              },
  o      = { ":Telescope vim_options<cr>",                " Vim options"        },
  q      = { ":Telescope quikfix<cr>",                    " Quickfix"           },
  r      = { ":Telescope registers<cr>",                  " Registers"          },
  s      = { ":Telescope current_buffer_fuzzy_find<cr>",  " Fuzzy in current buffer" },
  S      = { ":Telescope spell_suggest<cr>",              "暈Spell suggest"      },
  t      = { ":Telescope current_buffer_tags<cr>",        " Current buffer tags"},
  T      = { ":Telescope tags<cr>",                       " Tags"               },
}

-- Todos
map.t    = {
  name   =                                            " Trouble Lsp",
  [" "]  = { "<Esc>",                                 " Close"              },
  r      =                                            " References",
  q      =                                            " Quickfix",
  l      =                                            " Loclist",
  w      =                                            "華Workspace diagnostics",
  d      =                                            " Document diagnostics",
}

map.w    = {
  name   =                                            " Window",
  H      = { cmdp(":vertical resize -5", ""),
             " Resize vertical"    },
  L      = { cmdp(":vertical resize +5", ""),
             " Resize vertical"    },
  J      = { cmdp(":resize -5", ""),
             " Resize horizontal"  },
  K      = { cmdp(":resize +5", ""),
             " Resize horizontal"  },
  h      = { cmdp("<C-w>h", "Move to left window"),
             " Move left"          },
  j      = { cmdp("<C-w>j", "Move to bottom window"),
             " Move down"          },
  k      = { cmdp("<C-w>k", "Move to top window"),
             " Move up"            },
  l      = { cmdp("<C-w>l", "Move to right window"),
             " Move right"         },
  D      = { cmdp("<C-w>o", "Other window closed"),
             " Close other window" },
  d      = { cmdp("<C-w>c", "Window closed"),
             " Close current window" },
  n      = { cmdp("<C-w>w", "Move to next window"),
             "怜Next window"        },
  p      = { cmdp("<C-w>p", "Move to previous window"),
             "玲Prev window"        },
  S      = { cmdp(":new", "New window buffer"),
             " New window buffer"  },
  V      = { cmdp(":vnew", "New vertical window buffer"),
             " New vertical window buffer"  },
  s      = { cmdp(":split", "Split horizontal"),
             "祈Horizontal split"   },
  v      = { cmdp(":vsplit", "Split vertical"),
             " Vertical split"    },
}


wk.register(map, { prefix = '<leader>' })


