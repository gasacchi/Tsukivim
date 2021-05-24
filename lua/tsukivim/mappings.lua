----------------------------------------------------------------------------
-- Mappings
-- ----------------------------------------------------------------------------

-- TODO = create mapping for mark and use insert `m` to use motion

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
-- Map Ctrl + Backspace to delete word
keymap("i", "<C-H>", "<C-W>", opts )

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

-- set keybind
local wk = require'which-key'

local map = {}

-- Single Mappings
map[" "] = { "<Esc>",                          " Close"                      }
map["."] = { ":Telescope find_files<cr>",      " Find File"                  }
map.Q    = { ":q!<cr>",                        " Quit Without Saving"        }
map.q    = { ":q<cr>",                         " Quit"                       }

-- Action TODO
map.a    = {
  name   =                                     "省+Actions",
  [" "]  = { "<Esc>",                          " Close"                     },
}

-- Buffers Mappings
map.b    = {
  name   =                                     " +Buffers",
  [" "]  = { "<Esc>",                          " Close"                 },
  D      = { ":bdelete ",                      "﫨Delete Buffer(s)"      },
  b      = { ":Telescope buffers<cr>",         " First buffer"          },
  d      = { ":bdelete %<cr>",                 " Delete current buffer" },
  f      = { ":bfirst<cr>",                    " First buffer"          },
  l      = { ":blast<cr>",                     " Last buffer"           },
  n      = { ":BufferLineCycleNext<cr>",       " Next buffer"           },
  p      = { ":BufferLineCyclePrev<cr>",       " Previous buffer"       },
}

-- Editors
map.e    =  {
  name   =                                     " +Editors",
  [" "]  = { "<Esc>",                          " Close"              },
  e      = { ":luafile %<cr>",                 "省Eval current file"  },
  E      = { ":luafile $MYVIMRC<cr>",          "省Eval init.lua"      },
  m      = { ":MinimapToggle<cr>",             " Minimap"            },
  h      = { ":let @/ = ''<cr>",               " No highlight search"},
  n      = { ":set invnumber<cr>",             " Line number"        },
  r      = { ":set invrelativenumber<cr>",     " Line number"        },
  z      = { ":Goyo<cr>",                      " Zen mode"           },
}

-- Files
map.f    = {
  name   =                                            " +Files",
  [" "]  = { "<Esc>",                                 " Close" },
  e      = { ":e ",                                   " Edit file(s)" },
  S      = { ":wq<cr>",                               " Save and exit" },
  n      = { ":DashboardNewFile<cr>",                 " New file" },
  s      = { ":w<cr>",                                " Save file" },
  k      = { ":SessionSave<cr>",                      " Keep session" },
  l      = { ":SessionLoad<cr>",                      " Last session" },
}

-- Git TODO = Still Cannot Commiting Neogit Bug
map.g    = {
  name   =                                                   " +Git",
  [" "]  = { "<Esc>",                                        " Close"          },
  g      = { ":lua require'neogit'.open{kind='split'}<cr>",  " Neogit"         },
  c      = { ":Neogit commit<cr>",                           " Commit"         },
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
  name   =                                            " +Help",
  [" "]  = { "<Esc>",                                 " Close"              },
  H      = { ":Telescope highlights<cr>",             " Highlights"         },
  h      = { ":Telescope help_tags<cr>",              " Help tags"          },
  m      = { ":Telescope man_pages<cr>",              "龎 Manual pages"      },
}

-- LSP
map.l    = {
  name   =                                        " +LSP",
  [" "]  = { "<Esc>",                             " Close"                  },
  h      =                                        " Hover documentation",
  H      =                                        " Help",
  n      =                                        "怜Diagnostics next",
  p      =                                        "玲Diagnostics prev",
  d      =                                        " Definitions",
  D      =                                        " Declaration",
  t      =                                        " Type definitions",
  i      =                                        " Implementation",
  r      =                                        " References",
  R      =                                        "凜Rename",
  f      =                                        " Format",
  a      =                                        " Code action",
  q      =                                        " Quickfix", -- FIX
  e      =                                        " Show line diagnostics",
  w      = {
    name   =                                      "華+Workspace",
    [" "]  = { "<Esc>",                           " Close"                  },
    a    =                                        " Add workspace folder",
    r    =                                        "凜Remove workspace folder",
    l    =                                        " List workspace",
  },
}


-- Hop / Jump Motions TODO = Use operator Motion
map.m    = {
  name   =                                        "省+Motion",
  [" "]  = { "<Esc>",                             " Close"                  },
  w      = { ":HopWord<cr>",                      " Hop word"               },
  p      = { ":HopPattern<cr>",                   " Hop pattern"            },
  l      = { ":HopLine<cr>",                      " Hop line"               },
  c      = { ":HopChar1<cr>",                     " Hop char 1"             },
  C      = { ":HopChar2<cr>",                     "了Hop char 2"             },
}

-- Open
map.o    = {
  name   =                                            "冷+Open",
  [" "]  = { "<Esc>",                                 " Close"              },
  e      = { ":NvimTreeToggle<cr>",                       "滑Tree"               },
  g      = { ":LazyGit<cr>",                              " LazyGit"            },
}

-- packer plugin manager
map.p    = {
  name   =                                            " +Plugin",
  [" "]  = { "<Esc>",                                 " Close" },
  C      = { ":PackerClean<cr>",                      "﯊ Clean" },
  c      = { ":PackerCompile<cr>",                    " Compile" },
  i      = { ":PackerInstall<cr>",                    " Install" },
  s      = { ":PackerSync<cr>",                       "痢Sync" },
  u      = { ":PackerUpdate<cr>",                     " Update" },
}

-- Search with Telescope
map.s    = {
  name   = " +Search",
  [" "]  = { "<Esc>",                              " Close"                     },
  ["."]  = { ":Telescope live_grep<cr>",           " Grep in current directory" },
  ["'"]  = { ":Telescope grep_string<cr>",         " Grep string ."             },
  [";"]  = { ":Telescope filetypes<cr>",           " Filetypes"                 },
  [","]  = { ":Telescope colorscheme<cr>",         " Colorschemes"              },
  b      = { ":Telescope buffers<cr>",             "﬘ Buffers"                   },
  B      = { ":Telescope builtin<cr>",             " Builtins"                  },
  c      = { ":Telescope commands<cr>",            " Commands"                  },
  C      = { ":Telescope command_history<cr>",     " Commands history"          },
  a      = { ":Telescope autocommands<cr>",        " Autocommands"              },
  f      = { ":Telescope find_files<cr>",          " Find file"                 },
  F      = { ":Telescope file_browser<cr>",        " File browser"              },
  g      = {
    [" "]= { "<Esc>",                              " Close"                     },
    name = " +Git",
    g    = { ":Telescope git_files<cr>",           " Files"                     },
    c    = { ":Telescope git_commits<cr>",         " Commits"                   },
    C    = { ":Telescope git_bcommits<cr>",        " Buffer commits"            },
    b    = { ":Telescope git_branches<cr>",        " Branches"                  },
    s    = { ":Telescope git_status<cr>",          " Status"                    },
  },
  h      = { ":Telescope oldfiles<cr>",            " History"                   },
  k      = { ":Telescope keymaps<cr>",             " Keymaps"                   },
  l      = {
    name = " +LSP",
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
  name   =                                            " +Todo",
  [" "]  = { "<Esc>",                                 " Close" },
  s      = { ":TodoTelescope<cr>",                    " Telescope" },
  t      = { ":TodoTrouble<cr>",                      "陼Trouble" },
  -- use trouble instead
  -- q      = { ":TodoQuickFix<cr>",                     " Quickfix" },
}
-- Window FIXME window resize
map.w    = {
  name   =                                            " +Window",
  [" "]  = { "<Esc>",                                 " Close"              },
  H      = { ":call animate#window_delta_width(-10)<cr>",  " Resize vertical"    },
  L      = { ":call animate#window_delta_width(10)<cr>",  " Resize vertical"    },
  J      = { ":call animate#window_delta_height(-10)<cr>", " Resize horizontal"  },
  K      = { ":call animate#window_delta_height(10)<cr>", " Resize horizontal"  },
  h      = { "<C-w>h<cr>",                                " Move left"          },
  j      = { "<C-w>j<cr>",                                " Move down"          },
  k      = { "<C-w>k<cr>",                                " Move up"            },
  l      = { "<C-w>l<cr>",                                " Move right"         },
  D      = { "<C-w>o<cr>",                                " Close other window" },
  d      = { "<C-w>c<cr>",                                " Close current window" },
  n      = { "<C-w>w<cr>",                                "怜Next window"        },
  p      = { "<C-w>p<cr>",                                "玲Prev window"        },
  S      = { ":new<cr>",                                  " New Window buffer"  },
  V      = { ":vnew<cr>",                                 " New Window buffer"  },
  s      = { ":split<cr>",                                "祈Horizontal split"   },
  v      = { ":vsplit<cr>",                               " Vertical split"    },
}




wk.register(map, { prefix = '<leader>' })


