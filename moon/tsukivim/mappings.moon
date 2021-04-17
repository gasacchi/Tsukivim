----------------------------------------------------------------------------
-- Mappings
-- ----------------------------------------------------------------------------

import cmd, let, get from require'modules.builtin'
import keymap, var from require'modules.builtin'.api

opts = 
  noremap: true

-- Disable Arrow keys
keymap "i", "<DOWN>", "<NOP>", opts
keymap "i", "<LEFT>", "<NOP>", opts
keymap "i", "<RIGHt>","<NOP>", opts
keymap "i", "<UP>",   "<NOP>", opts
keymap "n", "<DOWN>", "<NOP>", opts
keymap "n", "<LEFT>", "<NOP>", opts
keymap "n", "<RIGHt>","<NOP>", opts
keymap "n", "<UP>",   "<NOP>", opts

-- Esc to jk
keymap "i", "jk",     "<ESC>", opts
-- Escape from command mode with jk
keymap "c", "jk",     "<C-c>", opts
-- Map Ctrl + Backspace to delete word
keymap "i", "<C-H>", "<C-W>", opts 

-- purescript Unicode shortcut
cmd "autocmd FileType purescript inoremap <buffer> ;l ∀"
cmd "autocmd FileType purescript inoremap <buffer> ;h ∷"
cmd "autocmd FileType purescript inoremap <buffer> ;d ←"
cmd "autocmd FileType purescript inoremap <buffer> ;t →"
cmd "autocmd FileType purescript inoremap <buffer> ;c ⇒"
cmd "autocmd FileType purescript inoremap <buffer> ;i ⇐"


-- Map q to exit help
cmd "autocmd FileType help noremap <buffer> q :close<CR>"

-- Map Leader to space
which_map_opts = 
  noremap: true
  silent: true

let 'mapleader', ' '

keymap "n",
  "<Leader>",
  ":silent WhichKey '<Space>'<CR>",
  which_map_opts

keymap "v",
  "<Leader>",
  ":silent <C-u> :silent WhichKeyVisual '<Space>'<CR>",
  which_map_opts

-- Buffers Mappings
keymap "n",
  "<Leader>bD",
  ":bdelete<Space>",
  opts

b =
  name: "﬘ +Buffers"
  D: "﫨Delete Buffer(s)"
  [" "]: { "<Esc>",                          " Close" }
  b: { ":Telescope buffers",                 " First buffer" }
  d: { ":bdelete %",                         " Delete current buffer" }
  f: { ":bfirst",                            " First buffer" }
  l: { ":blast",                             " Last buffer" }
  n: { ":BufferLineCycleNext",               " Next buffer" }
  p: { ":BufferLineCyclePrev",               " Previous buffer" }

-- Search with Telescope
s = 
  name: " +Search"
  [" "]: { "<Esc>",                          " Close" }
  ["."]: { ":Telescope live_grep",           " Grep in current directory" }
  ["'"]: { ":Telescope grep_string",         " Grep string ." }
  [";"]: { ":Telescope filetypes",           " Filetypes" }
  [","]: { ":Telescope colorscheme",         " Colorschemes" }
  b: { ":Telescope buffers",                 "﬘ Buffers" }
  B: { ":Telescope builtin",                 " Builtins" }
  c: { ":Telescope commands",                " Commands" }
  C: { ":Telescope command_history",         " Commands history" }
  a: { ":Telescope autocommands",            " Autocommands" }
  f: { ":Telescope find_files",              " Find file" }
  F: { ":Telescope file_browser",            " File browser" }
  g:
    [" "]: { "<Esc>",                        " Close" }
    name: " +Git"
    g: { ":Telescope git_files",             " Files" }
    c: { ":Telescope git_commits",           " Commits" }
    C: { ":Telescope git_bcommits",          " Buffer commits" }
    b: { ":Telescope git_branches",          " Branches" }
    s: { ":Telescope git_status",            " Status" }
  h: { ":Telescope oldfiles",                " History" }
  k: { ":Telescope keymaps",                 " Keymaps" }
  l:
    name: " +LSP"
    [" "]: { "<Esc>",                                 " Close" }
    ["."]: { ":Telescope lsp_definitions",            " Definitions" }
    r: { ":Telescope lsp_references",                 " References" }
    d: { ":Telescope lsp_document_symbols",           " Document symbols" }
    w: { ":Telescope lsp_workspace_symbols",          "華Workspace symbols" }
    a: { ":Telescope lsp_code_actions",               " Code actions" }
    R: { ":Telescope lsp_range_code_actions",         " Range actions" }
    D: { ":Telescope lsp_document_diagnostics",       " Document diagnostics" }
    W: { ":Telescope lsp_workspace_diagnostics",      " Workspace diagnostics"}
  m: { ":Telescope marks",                      " Marks" }
  o: { ":Telescope vim_options",                " Vim options" }
  q: { ":Telescope quikfix",                    " Quickfix" }
  r: { ":Telescope registers",                  " Registers" }
  s: { ":Telescope current_buffer_fuzzy_find",  " Fuzzy in current buffer" }
  S: { ":Telescope spell_suggest",              "暈Spell suggest" }
  t: { ":Telescope current_buffer_tags",        " Current buffer tags" }
  T: { ":Telescope tags",                       " Tags" }

h =
  name: " +Help"
  [" "]: { "<Esc>",                          " Close" }
  H: { ":Telescope highlights",              " Highlights" }
  h: { ":Telescope help_tags",               " Help tags" }
  m: { ":Telescope man_pages",               "龎 Manual pages" }

-- Open
o = 
  name: "冷+Open"
  [" "]: { "<Esc>",                          " Close" }
  e: { ":NvimTreeToggle",                    "滑Tree" }

-- Editor
-- TODO: find better approach
eval = (file = vim.g.file_to_eval) ->
  cmd "let g:file_to_eval = substitute(expand('%:p'), 'moon', 'lua', 'g')"
  cmd "luafile #{file}"
  

compile_and_eval = (file) ->
  unless file == "init"
    cmd "MoonCompile"
    eval!
  else
    cmd "!moonc $NVIM_ROOT/init.moon"
    cmd "luafile $NVIM_ROOT/init.lua"

e = 
  name: " +Editor"
  [" "]: { "<Esc>",                          " Close" }
  c: { ":e $NVIM_ROOT/init.moon",            " Edit config file" }
  e: { ":Moon require'tsukivim.mappings'.compile_and_eval!",       "省Compile and Eval" }
  E: { ":Moon require'tsukivim.mappings'.compile_and_eval 'init'",       "省Compile and Eval" }
  C: { ":!moonc $NVIM_ROOT/init.moon",       " Compile init file" }
  m: { ":MinimapToggle",                     " Minimap" }
  h: { ":let @/ = ''",                       " No highlight search" }
  n: { ":set invnumber",                     " Line number" }
  r: { ":set invrelativenumber",             " Line number" }
  z: { ":Goyo",                              " Zen mode" }

-- Git TODO: Still Cannot Commiting Neogit Bug
g = 
  name: " +Git"
  [" "]: { "<Esc>",                                       " Close" }
  g: { ":Moon require'neogit'.open kind: 'split'",        " Neogit"}
  c: { ":Neogit commit",                                  " Commit"}
  s:  " Stage hunk"
  u:  " Unstage hunk"
  R:  "﬘ Reset buffer"
  r:  "痢Reset hunk"
  P:  " Preview hunk"
  b:  " Blame line"
  p:  "玲Previous hunk"
  n:  "怜Next hunk"

-- File Mapping
keymap "n" ,
  "<Leader>fe",
  ":e<SPACE>",
  opts

f =
  name: " +File"
  e: " Edit file(s)"
  [" "]: { "<Esc>",                          " Close" }
  S: { ":wq",                                " Save and exit" }
  n: { ":DashboardNewFile",                  " New file" }
  s: { ":w",                                 " Save file" }
  k: { ":SessionSave",                       " Keep session" }
  l: { ":SessionLoad",                       " Last session" }

-- Plugin Mapping
p = 
  name: " +Plugin"
  [" "]: { "<Esc>",                          " Close" }
  C: { ":PackerClean",                       "﯊ Clean" }
  c: { ":PackerCompile",                     " Compile" }
  i: { ":PackerInstall",                     " Install" }
  s: { ":PackerSync",                        "痢Sync" }
  u: { ":PackerUpdate",                      " Update" }


-- LSP
l = 
  name: " +LSP"
  [" "]: { "<Esc>",                          " Close" }
  h:  { ":call g:Show_documentation()",      " Hover documentation" }
  n:  { "<Plug>(coc-diagnostic-next)",       "怜Diagnostics next" }
  p:  { "<Plug>(coc-diagnostic-prev)",       "玲Diagnostics prev" }
  d:  { "<Plug>(coc-definition)",            " Definitions" }
  t:  { "<Plug>(coc-type-definition)",       " Type definitions" }
  i:  { "<Plug>(coc-implementation)",        " Implementation" }
  r:  { "<Plug>(coc-references)",            " References" }
  R:  { "<Plug>(coc-rename)",                "凜Rename" }
  f:  { ":Format",                           " Format" }
  a:  { "<Plug>(coc-codeaction-selected)",   " Code action selected" }
  c:  { "<Plug>(coc-codeaction)",            " Code action" }
  q:  { "<Plug>(coc-fix-current)",           " Fix current line" }
  l:
    name: " +Coc list"
    [" "]: { "<Esc>",                        " Close" }
    a: { ":<C-u>CocList diagnostics",        " Diagnostics" }
    e: { ":<C-u>CocList extensions",         " Extensions" }
    c: { ":<C-u>CocList commands",           " Commands" }
    o: { ":<C-u>CocList outline",            " Outline" }
    s: { ":<C-u>CocList -I symbols",         "$ Symbols" }
    j: { ":<C-u>CocNext",                    "怜Next item" }
    k: { ":<C-u>CocPrev",                    "玲Previous item" }
    p: { ":<C-u>CocListResume",              " Resume latest coc list" }

-- Hop / Jump Motions TODO: Use operator Motion
m =  
  name: "省+Motion"
  [" "]: { "<Esc>",                          " Close" }
  w: { ":HopWord",                           " Hop word" }
  p: { ":HopPattern",                        " Hop pattern" }
  l: { ":HopLine",                           " Hop line" }
  c: { ":HopChar1",                          " Hop char 1" }
  C: { ":HopChar2",                          "了Hop char 2" }

-- Tab Mapping
t = 
  name: "ﴵ +Tab"
  [" "]: { "<Esc>",                          " Close" }
  ["."]: { ":tab split",                     "麟Open current buffer in new tab" }
  t: { ":tabnew",                            "ﱚ New tab with empty buffer" }
  d: { ":tabclose",                          "林Close current tab" }
  D: { ":tabonly",                           "林Close other tab" }
  f: { ":tabfirst",                          "﫿First tab" }
  l: { ":tablast",                           "ﬀ Last tab" }
  n: { ":tabNext",                           "怜Next tab" }
  p: { ":tabprevious",                       "玲Previous tab" }

-- Window
w =
  name: " +Window",
  [" "]: { "<Esc>",                                " Close" }
  H: { ":call animate#window_delta_width(10)",     " Resize vertical" }
  J: { "call animate#window_delta_height(-10)",    " Resize horizontal" }
  K: { ":call animate#window_delta_height(10)",    " Resize horizontal" }
  L: { ":call animate#window_delta_width(-10)",    " Resize vertical" }
  h: { "<C-w>h",                                   " Move left" }
  j: { "<C-w>j",                                   " Move down" }
  k: { "<C-w>k",                                   " Move up" }
  l: { "<C-w>l",                                   " Move right" }
  D: { "<C-w>o",                                   " Close other window " }
  d: { "<C-w>c",                                   " Close current window " }
  n: { "<C-w>w",                                   "怜Next window" }
  p: { "<C-w>p",                                   "玲Prev window" }
  S: { ":new",                                     " New Window buffer" }
  V: { ":vnew",                                    " New Window buffer" }
  s: { ":split",                                   "祈Horizontal split" }
  v: { ":vsplit",                                  " Vertical split" }

-- Single Mapping
map =
  :b
  :e
  :f
  :g
  :h
  :l
  :m
  :o
  :p
  :s
  :t
  :w
  [" "]: { "<Esc>",                          " Close" }
  ["."]: { ":Telescope find_files",          " Find File"}
  [";"]: { "gcc",                            " Comment" }
  Q: { ":q!",                                " Quit Without Saving" }
  q: { ":q",                                 " Quit" }

-- Set vim global variable
var "which_key_map", map

-- Register WhichKey
cmd "call which_key#register(' ', 'g:which_key_map')"

return :eval, :compile_and_eval, :treeopen
