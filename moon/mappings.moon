
----------------------------------------------------------------------------
-- Mappings
-- ----------------------------------------------------------------------------

import cmd,g from vim
import nvim_set_keymap,nvim_set_var from vim.api

opts = noremap: true

-- Disable Arrow keys
nvim_set_keymap "i", "<DOWN>", "<NOP>", opts
nvim_set_keymap "i", "<LEFT>", "<NOP>", opts
nvim_set_keymap "i", "<RIGHt>", "<NOP>", opts
nvim_set_keymap "i", "<UP>", "<NOP>", opts
nvim_set_keymap "n", "<DOWN>", "<NOP>", opts
nvim_set_keymap "n", "<LEFT>", "<NOP>", opts
nvim_set_keymap "n", "<RIGHt>", "<NOP>", opts
nvim_set_keymap "n", "<UP>", "<NOP>", opts

-- Esc to jk
nvim_set_keymap "i", "jk", "<ESC>", opts
-- Escape from command mode with jk
nvim_set_keymap "c", "jk", "<C-c>", opts

-- purescript Unicode shortcut
cmd "autocmd FileType purescript inoremap <buffer> ;l ∀"
cmd "autocmd FileType purescript inoremap <buffer> ;h ∷"
cmd "autocmd FileType purescript inoremap <buffer> ;d ←"
cmd "autocmd FileType purescript inoremap <buffer> ;t →"
cmd "autocmd FileType purescript inoremap <buffer> ;c ⇒"
cmd "autocmd FileType purescript inoremap <buffer> ;i ⇐"

-- Map Leader to space
which_map_opts = noremap: true, silent: true

g.mapleader = " "

nvim_set_keymap "n", "<Leader>",
  ":silent WhichKey '<Space>'<CR>", which_map_opts

nvim_set_keymap "v","<Leader>",
  ":silent <C-u> :silent WhichKeyVisual '<Space>'<CR>", which_map_opts

-- Buffer Mapping
nvim_set_keymap "n", "<Leader>bD",
  ":bdelete<Space>", opts

b =
  name: "﬘ Buffers",
  D: "﫨Delete Buffer(s)",
  [" "]: { "<Esc>",                  " Close" },
  b: { ":Telescope buffers",         " First buffer" },
  d: { ":bdelete %",                 " delete current buffer" },
  f: { ":bfirst",                    " First buffer" },
  l: { ":blast",                     " Last buffer" },
  n: { ":BufferLineCycleNext",       " Next Buffer" },
  p: { ":BufferLineCyclePrev",       " Previous Buffer" },

s = -- TODO: mapping all Telescope functions
  name: " Search",
  [" "]: { "<Esc>",                  " Close" },
  ["."]: { ":Telescope live_grep",   " Live Grep" },
  b: { ":Telescope marks",           " Bookmarks" },
  c: { ":Telescope colorscheme",     " Colorschemes" },
  g: { ":Telescope git_files",       " Git Files" },
  h: { ":Telescope oldfiles",        " History / Recent Files" },
  k: { ":SessionSave",               " Keep Session" },
  l: { ":SessionLoad",               " Last Sessions" },
  s: { ":Telescope file_browser",    "  Keep Session" },

h =
  name: " Help",
  [" "]: { "<Esc>",                  " Close" },
  H: { ":Telescope highlights",      " Highlights" },
  c: { ":Telescope commands",        " Commands" },
  f: { ":Telescope filetypes",       " Filetypes" },
  h: { ":Telescope help_tags",       " Help Tags" },
  k: { ":Telescope keymaps",         "  Keymaps" },
  m: { ":Telescope man_pages",       "龎 Manual Pages" },

-- Open
o = 
  name: "冷Open",
  [" "]: { "<Esc>",                  " Close" },
  t: { ":NvimTreeToggle",            "滑Tree" },

-- Editor
e = 
  name: " Editor",
  [" "]: { "<Esc>",                  " Close" },
  e: { ":luafile %",                 "省Eval Current Lua File" },
  M: { ":MinimapToggle",             " Minimap" },
  m: { ":MoonCompile",               "Compile" },
  h: { ":let @/ = ''",               " No Highlight Search" },
  n: { ":set invnumber",             " Line Number" },
  r: { ":set invrelativenumber",     " Line Number" },
  c: { ":e $MYVIMRC",                " Edit Config File" },
  z: { ":Goyo",                      " Zen Mode" },

-- Git TODO: Still Cannot Commiting Neogit Bug
g = 
  name: " Git",
  [" "]: { "<Esc>",                                       " Close" },
  g: { ":lua require'neogit'.open{ kind = 'split' }", " Neogit"},
  c: { ":Neogit commit",                                  " Commit"},
  s:  " Stage Hunk",
  u:  " Unstage Hunk",
  R:  "﬘ Reset Buffer",
  r:  "痢Reset Hunk",
  P:  " Preview Hunk",
  b:  " Blame Line",
  p:  "玲Previous Hunk",
  n:  "怜Next Hunk"

-- File Mapping
nvim_set_keymap "n" ,"<Leader>fe",
  ":e<SPACE>",opts

f =
  name: " File",
  e: " Edit file(s)",
  [" "]: { "<Esc>",                  " Close" },
  S: { ":wq",                        " Save and Exit" },
  n: { ":DashboardNewFile",          " New File" },
  s: { ":w",                         " Save file" },

-- Plugin Mapping
p = 
  name: " Plugin",
  [" "]: { "<Esc>",                  " Close" },
  C: { ":PackerClean",               "﯊ Clean" },
  c: { ":PackerCompile",             " Compile" },
  i: { ":PackerInstall",             "  Install" },
  s: { ":PackerSync",                "痢Sync" },
  u: { ":PackerUpdate",              " Update" },

-- Hop / Jump Motions TODO: Use operator Motion
m =  
  name: "省Motion",
  [" "]: { "<Esc>",                  " Close" },
  w: { ":HopWord",                   " Hop Word" },
  p: { ":HopPattern",                " Hop Pattern" },
  l: { ":HopLine",                   " Hop Line" },
  c: { ":HopChar1",                  " Hop Char 1" },
  C: { ":HopChar2",                  "了 Hop Char 2" },


-- Window
w =
  name: " Window",
  [" "]: { "<Esc>",                  " Close" },
  H: { ":vertical resize -2",        " -Resize Vertical" },
  J: { ":resize -2",                 " +Resize Horizontal" },
  K: { ":resize +2",                 " -Resize Horizontal" },
  L: { ":vertical resize +2",        " +Resize Vertical" },
  h: { "<C-w>h",                     " Move Left" },
  j: { "<C-w>j",                     " Move Down" },
  k: { "<C-w>k",                     " Move Up" },
  l: { "<C-w>l",                     " Move Right" },
  o: { "<C-w>o",                     " Close Other Window " },
  c: { "<C-w>c",                     " Close Current Window " },
  n: { "<C-w>w",                     "怜Next Window" },
  p: { "<C-w>p",                     "玲Prev Window" },
  w: { "<C-w>n",                     " New Window Buffer" },
  s: { ":split",                     "祈Horizontal Split" },
  v: { ":vsplit",                    " Vertical Split" },

-- Single Mapping
-- map["h"] =  { ":let @/ = """, " No Highlight Search" }
map =
  :b,
  :e,
  :f,
  :g,
  :h,
  :m,
  :o,
  :p,
  :s,
  :w,
  [" "]: { "<Esc>",                " Close" }
  ["."]: { ":Telescope find_files"," Find File"}
  [";"]: { "gcc",                  " Comment" }
  Q: { ":q!",                      " Quit Without Saving" }
  q: { ":q",                       " Quit" }

-- Set vim global variable
nvim_set_var "which_key_map", map

-- Register WhichKey
cmd "call which_key#register(' ', 'g:which_key_map')"

return 
