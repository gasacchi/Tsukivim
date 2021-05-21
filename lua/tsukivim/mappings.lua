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

-- Map Leader to space
local which_map_opts = {
  noremap = true,
  silent = true,
}

-- set leader to <space>
vim.g.mapleader = ' '

keymap("n", "<Leader>", ":silent WhichKey '<Space>'<CR>", which_map_opts)

keymap("v", "<Leader>",":silent <C-u> :silent WhichKeyVisual '<Space>'<CR>", which_map_opts)


local map = {}

-- Single Mappings
map[" "] = { "<Esc>",                          " Close"                      }
map["."] = { ":Telescope find_files",          " Find File"                  }
map[";"] = { "gcc",                            " Comment"                    }
map.Q    = { ":q!",                            " Quit Without Saving"        }
map.q    = { ":q",                             " Quit"                       }

-- Action TODO
map.a    = {
  name   = "省+Actions",
  [" "]  = { "<Esc>",                          " Close"                     },
}


-- Buffers Mappings
-- with input arguments
keymap("n","<Leader>bD",":bdelete<Space>",opts)

map.b    = {
  name   = "﬘ +Buffers",
  [" "]  = { "<Esc>",                              " Close"                 },
  D      = "﫨Delete Buffer(s)",
  b      = { ":Telescope buffers",                 " First buffer"          },
  d      = { ":bdelete %",                         " Delete current buffer" },
  f      = { ":bfirst",                            " First buffer"          },
  l      = { ":blast",                             " Last buffer"           },
  n      = { ":BufferLineCycleNext",               " Next buffer"           },
  p      = { ":BufferLineCyclePrev",               " Previous buffer"       },
}

-- Search with Telescope
map.s    = {
  name   = " +Search",
  [" "]  = { "<Esc>",                          " Close"                     },
  ["."]  = { ":Telescope live_grep",           " Grep in current directory" },
  ["'"]  = { ":Telescope grep_string",         " Grep string ."             },
  [";"]  = { ":Telescope filetypes",           " Filetypes"                 },
  [","]  = { ":Telescope colorscheme",         " Colorschemes"              },
  b      = { ":Telescope buffers",             "﬘ Buffers"                   },
  B      = { ":Telescope builtin",             " Builtins"                  },
  c      = { ":Telescope commands",            " Commands"                  },
  C      = { ":Telescope command_history",     " Commands history"          },
  a      = { ":Telescope autocommands",        " Autocommands"              },
  f      = { ":Telescope find_files",          " Find file"                 },
  F      = { ":Telescope file_browser",        " File browser"              },
  g      = {
    [" "]= { "<Esc>",                          " Close"                     },
    name = " +Git",
    g    = { ":Telescope git_files",           " Files"                     },
    c    = { ":Telescope git_commits",         " Commits"                   },
    C    = { ":Telescope git_bcommits",        " Buffer commits"            },
    b    = { ":Telescope git_branches",        " Branches"                  },
    s    = { ":Telescope git_status",          " Status"                    },
  },
  h      = { ":Telescope oldfiles",            " History"                   },
  k      = { ":Telescope keymaps",             " Keymaps"                   },
  l      = {
    name = " +LSP",
    [" "]= { "<Esc>",                                 " Close"              },
    ["."]= { ":Telescope lsp_definitions",            " Definitions"        },
    r    = { ":Telescope lsp_references",             " References"         },
    d    = { ":Telescope lsp_document_symbols",       " Document symbols"   },
    w    = { ":Telescope lsp_workspace_symbols",      "華Workspace symbols"  },
    a    = { ":Telescope lsp_code_actions",           " Code actions"       },
    R    = { ":Telescope lsp_range_code_actions",     " Range actions"      },
    D    = { ":Telescope lsp_document_diagnostics",   " Document diagnostics" },
    W    = { ":Telescope lsp_workspace_diagnostics",  " Workspace diagnostics"},
  },
  m      = { ":Telescope marks",                      " Marks"              },
  o      = { ":Telescope vim_options",                " Vim options"        },
  q      = { ":Telescope quikfix",                    " Quickfix"           },
  r      = { ":Telescope registers",                  " Registers"          },
  s      = { ":Telescope current_buffer_fuzzy_find",  " Fuzzy in current buffer" },
  S      = { ":Telescope spell_suggest",              "暈Spell suggest"      },
  t      = { ":Telescope current_buffer_tags",        " Current buffer tags"},
  T      = { ":Telescope tags",                       " Tags"               },
}

-- Help
map.h    = {
  name   =                                            " +Help",
  [" "]  = { "<Esc>",                                 " Close"              },
  H      = { ":Telescope highlights",                 " Highlights"         },
  h      = { ":Telescope help_tags",                  " Help tags"          },
  m      = { ":Telescope man_pages",                  "龎 Manual pages"      },
}

-- Open
map.o    = {
  name   =                                            "冷+Open",
  [" "]  = { "<Esc>",                                 " Close"              },
  e      = { ":NvimTreeToggle",                       "滑Tree"               },
  g      = { ":LazyGit",                              " LazyGit"            },
}

-- Coc TODO use lspconfig instead
map.c    = {
  name   =                                            " +Coc",
  [" "]  = { "<Esc>",                                 " Close"              },
  c      = { ":CocConfig",                            " Configuration"      },
  d      = { ":CocDisable",                           " Disable"            },
  r      = { ":CocRestart",                           " Restart"            },
  s      = { ":CocStart",                             " Start"              },
  l      = {
    name =                                            "  +Coc list",
    [" "]= { "<Esc>",                                 " Close"              },
    a    = { ":CocList diagnostics",                  " Diagnostics"        },
    e    = { ":CocList extensions",                   " Extensions"         },
    c    = { ":CocList commands",                     " Commands"           },
    o    = { ":CocList outline",                      " Outline"            },
    s    = { ":CocList -I symbols",                   "$ Symbols"            },
    j    = { ":CocNext",                              "怜Next item"          },
    k    = { ":CocPrev",                              "玲Previous item"      },
    p    = { ":CocListResume",                        " Resume latest coc list" },
  },
}

-- Editors
map.e    =  {
  name   =                                            " +Editors",
  [" "]  = { "<Esc>",                                 " Close"              },
  e      = { ":luafile %",                            "省Eval current file"  },
  E      = { ":luafile $MYVIMRC",                     "省Eval init.lua"      },
  m      = { ":MinimapToggle",                        " Minimap"            },
  h      = { ":let @/ = ''",                          " No highlight search"},
  n      = { ":set invnumber",                        " Line number"        },
  r      = { ":set invrelativenumber",                " Line number"        },
  z      = { ":Goyo",                                 " Zen mode"           },
}

-- Git TODO = Still Cannot Commiting Neogit Bug
map.g    = {
  name   =                                                " +Git",
  [" "]  = { "<Esc>",                                     " Close"          },
  g      = { ":lua require'neogit'.open{kind='split'}",   " Neogit"         },
  c      = { ":Neogit commit",                            " Commit"         },
  s      =                                                " Stage hunk",
  u      =                                                " Unstage hunk",
  R      =                                                "﬘ Reset buffer",
  r      =                                                "痢Reset hunk",
  P      =                                                " Preview hunk",
  b      =                                                " Blame line",
  p      =                                                "玲Previous hunk",
  n      =                                                "怜Next hunk",
}

-- File Mapping
keymap("n", "<Leader>fe", ":e<SPACE>", opts)

map.f    = {
  name   =                                            " +File",
  [" "]  = { "<Esc>",                                 " Close" },
  e      =                                            " Edit file(s)",
  S      = { ":wq",                                   " Save and exit" },
  n      = { ":DashboardNewFile",                     " New file" },
  s      = { ":w",                                    " Save file" },
  k      = { ":SessionSave",                          " Keep session" },
  l      = { ":SessionLoad",                          " Last session" },
}

-- Plugin Mapping
map.p    = {
  name   =                                            " +Plugin",
  [" "]  = { "<Esc>",                                 " Close" },
  C      = { ":PackerClean",                          "﯊ Clean" },
  c      = { ":PackerCompile",                        " Compile" },
  i      = { ":PackerInstall",                        " Install" },
  s      = { ":PackerSync",                           "痢Sync" },
  u      = { ":PackerUpdate",                         " Update" },
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
  w      = { ":HopWord",                          " Hop word"               },
  p      = { ":HopPattern",                       " Hop pattern"            },
  l      = { ":HopLine",                          " Hop line"               },
  c      = { ":HopChar1",                         " Hop char 1"             },
  C      = { ":HopChar2",                         "了Hop char 2"             },
}

-- Tab Mapping
map.t    = {
  name   =                                        "ﴵ +Tab",
  [" "]  = { "<Esc>",                             " Close"                  },
  ["."]  = { ":tab split",                        "麟Open current buffer in new tab" },
  t      = { ":tabnew",                           "ﱚ New tab with empty buffer" },
  d      = { ":tabclose",                         "林Close current tab"      },
  D      = { ":tabonly",                          "林Close other tab"        },
  f      = { ":tabfirst",                         "﫿First tab"              },
  l      = { ":tablast",                          "ﬀ Last tab"               },
  n      = { ":tabNext",                          "怜Next tab"               },
  p      = { ":tabprevious",                      "玲Previous tab"           },
}

-- Window
map.w    = {
  name   =                                            " +Window",
  [" "]  = { "<Esc>",                                 " Close"              },
  H      = { ":call animate#window_delta_width(10)",  " Resize vertical"    },
  J      = { "call animate#window_delta_height(-10)", " Resize horizontal"  },
  K      = { ":call animate#window_delta_height(10)", " Resize horizontal"  },
  L      = { ":call animate#window_delta_width(-10)", " Resize vertical"    },
  h      = { "<C-w>h",                                " Move left"          },
  j      = { "<C-w>j",                                " Move down"          },
  k      = { "<C-w>k",                                " Move up"            },
  l      = { "<C-w>l",                                " Move right"         },
  D      = { "<C-w>o",                                " Close other window" },
  d      = { "<C-w>c",                                " Close current window" },
  n      = { "<C-w>w",                                "怜Next window"        },
  p      = { "<C-w>p",                                "玲Prev window"        },
  S      = { ":new",                                  " New Window buffer"  },
  V      = { ":vnew",                                 " New Window buffer"  },
  s      = { ":split",                                "祈Horizontal split"   },
  v      = { ":vsplit",                               " Vertical split"    },
}

-- Set vim global variable
setvar( "which_key_map", map)

-- Register WhichKey
cmd("call which_key#register(' ', 'g:which_key_map')")

