---------------------------------------------------------------------------
-- Mappings
-- ----------------------------------------------------------------------------
   
local keymap = vim.api.nvim_set_keymap 
local keymap_buff = vim.api.nvim_buf_set_keymap 
local setvar = vim.api.nvim_set_var
local cmd = vim.cmd
local gui = vim.g.nvui

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
-- keymap("n", "Y", "y$", opts)
-- consistent jump in middle
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)


-- Terminal map
function _G.set_terminal_keymaps()
  keymap_buff(0, 't', '<esc>',  [[<C-\><C-n>]], opts)
  keymap_buff(0, 't', 'jk',     [[<C-\><C-n>]], opts)
  keymap_buff(0, 't', '<C-h>',  [[<C-\><C-n><C-W>h]], opts)
  keymap_buff(0, 't', '<C-j>',  [[<C-\><C-n><C-W>j]], opts)
  keymap_buff(0, 't', '<C-k>',  [[<C-\><C-n><C-W>k]], opts)
  keymap_buff(0, 't', '<C-l>',  [[<C-\><C-n><C-W>l]], opts)
  keymap_buff(0, 't', '<C-l>',  [[<C-\><C-n><C-W>l]], opts)
  keymap_buff(0, 't', '<C-t>n', [[<C-\><C-n>:tabnext<cr>]], opts)
  keymap_buff(0, 't', '<C-t>p', [[<C-\><C-n>:tabnext<cr>]], opts)
  keymap_buff(0, 't', '<C-t>p', [[<C-\><C-n>:tabnext<cr>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


-- Map q to exit help
cmd "autocmd FileType help noremap <buffer> q :close<CR>"
-- Map q to exit Dashboard
cmd "autocmd FileType dashboard noremap <buffer> q :q<CR>"
-- for quikfix
cmd "autocmd FileType qf noremap <buffer> q :q<CR>"

-- TODO: temporary file type
cmd "autocmd FileType qf noremap <buffer> q :q<CR>"

-- require which-key default config
vim.g.timeoutlen = 500
keymap("n", " ", ":WhichKey <leader><cr>", opts )
require'modules.ui.whichkey'


-- execute command without printing message
local function exec(c, desc)
  return { 
    c .. "<cr>",
    desc
    }
end

-- execute command and print message
local function execm(c,message, desc)
  return { 
    string.format("%s<cr>:lua require'modules.ui.notify'.info('%s')<cr>", c, message),
    desc
    }
end


local wk = require'which-key'

local map = {}


-- ----------------------------------------------------------------------------
-- Single Mappings
-- ----------------------------------------------------------------------------
map[" "] = exec("<Esc>", "Close")
map["."] = exec(":Telescope file_browser", "Browse files")
map[","] = exec(":lua require'telescope.builtin'.buffers(require'telescope.themes'.get_dropdown({}))",  "Switch buffer")
map.Q    = exec(":q!", "Quit without saving")
map.q    = exec(":q", "Quit")
-- TODO: check if there is tab use tab(next) / s-tab(prev) otherwise use buffer instead
map["<tab>"] = execm(":tabnext", "Move to next tab", "Next tab")


-- ----------------------------------------------------------------------------
-- Action Mappings
-- ----------------------------------------------------------------------------
map.a    = {
  name   = "Actions",
  [" "]  = exec("<Esc>", "Close"),
  p      = execm('"+p', "Paste..", "Paste from clipboard"),
  y      = execm('"+y', "Yank..", "Yank to clipboard"),
}


-- ----------------------------------------------------------------------------
-- Buffer Mappings
-- ----------------------------------------------------------------------------
map.b    = {
  name   = "Buffers",
  [" "]  = exec("<Esc>", "Close"),
  s      = exec(":lua require'telescope.builtin'.buffers(require'telescope.themes'.get_dropdown({}))",  "Switch buffer"),
  d      = exec(":bdelete %", "Delete buffer"),
  D      = exec(":BufferLinePickClose", "Pick and delete buffer"),
  b      = exec(":BufferLinePick", "Pick and go to buffer"),
  f      = execm(":bfirst", "Move to first buffer", "First buffer"),
  l      = execm(":blast", "Move to last buffer", "Last buffer"),
  n      = execm(":BufferLineCycleNext", "Move to next buffer", "Next buffer"),
  p      = execm(":BufferLineCyclePrev", "Move to previous buffer", "Previous buffer"),
  ["1"]  = execm(":BufferLineGoToBuffer 1", "Switch to buffer 1", "Buffer 1"),
  ["2"]  = execm(":BufferLineGoToBuffer 2", "Switch to buffer 2", "Buffer 2"),
  ["3"]  = execm(":BufferLineGoToBuffer 3", "Switch to buffer 3", "Buffer 3"),
  ["4"]  = execm(":BufferLineGoToBuffer 4", "Switch to buffer 4", "Buffer 4"),
  ["5"]  = execm(":BufferLineGoToBuffer 5", "Switch to buffer 5", "Buffer 5"),
  ["6"]  = execm(":BufferLineGoToBuffer 6", "Switch to buffer 6", "Buffer 6"),
  ["7"]  = execm(":BufferLineGoToBuffer 7", "Switch to buffer 7", "Buffer 7"),
  ["8"]  = execm(":BufferLineGoToBuffer 8", "Switch to buffer 8", "Buffer 8"),
  ["9"]  = execm(":BufferLineGoToBuffer 9", "Switch to buffer 9", "Buffer 9"),
  --[[ ["<tab>"]    = execm(":BufferLineCycleNext", "Switch to buffer 9", "Buffer 9"),
  ["<S-tab>"]  = execm(":BufferLineCyclePrev", "Switch to buffer 9", "Buffer 9"), ]]
}

-- ----------------------------------------------------------------------------
-- Code Mappings
-- ----------------------------------------------------------------------------
map.c    = {
  name   = "Code",
  [" "]  = exec("<Esc>", "Close"),
  r      = exec(":TermExec dir=git_dir cmd='dotnet fsi' go_back=0", "Repl")
}


-- ----------------------------------------------------------------------------
-- Editor Mappings
-- ----------------------------------------------------------------------------
map.e    = {
  name   = "Editors",
  [" "]  = exec("<Esc>", "Close"),
  c      = exec(":e /home/gasacchi/.config/nvim", "Tsukivim config"),
  C      = execm(":checkhealth", "Checking health", "Check Health"),
  -- e      = execm(":luafile %", "Current file evaluated", "Eval current file"),
  e      = execm(":", "Current file evaluated", "Eval current file"),
  f      = exec(":NvuiToggleFullscreen", "Toggle fullscreen"),
  E      = execm(":luafile $MYVIMRC", "Init.lua evaluated", "Eval init.lua"),
  h      = execm(":let @/ = ''", "highlight search off", "No hl search"),
  n      = execm(":set invnumber", "Toggle number line","Toggle line number"),
  r      = execm(":set invrelativenumber", "Toggle relative number","Toggle relative number"),
}

-- ----------------------------------------------------------------------------
-- Files Mappings
-- ----------------------------------------------------------------------------
-- Files
map.f    = {
  name   = "Files",
  [" "]  = exec("<Esc>", "Close"),
  s      = execm(":w", "File saved", "Save file"),           
  e      = { ":e ",                                   "Edit file(s)" },
  n      = exec(":DashboardNewFile", "Open blank file","New blank file" ),
  S      = exec(":wq", "Save & exit" ),
  f      = exec(":Telescope find_files", "Find files" ),
  b      = exec(":Telescope file_browser", "Browse files" ),
  h      = exec(":Telescope oldfiles", "Recently opened files" ),
}

-- ----------------------------------------------------------------------------
-- Git Mappings
-- ----------------------------------------------------------------------------
map.g    = {
  name   =                                                   "Git",
  [" "]  = exec("<Esc>", "Close"),
  g      = exec(":lua require'neogit'.open{kind='split'}", "Neogit"),
  c      = execm(":Neogit commit", "Open git commit", "Commit"),

  -- Mapping from gitsigns: ../modules/git/gitsigns.lua
  s      = "Stage hunk",
  u      = "Unstage hunk",
  R      = "Reset buffer",
  r      = "Reset hunk",
  P      = "Preview hunk",
  b      = "Blame line",
  p      = "Previous hunk",
  n      = "Next hunk",
}

-- ----------------------------------------------------------------------------
-- Help Mappings
-- ----------------------------------------------------------------------------
map.h    = {
  name   = "Help",
  [" "]  = exec("<Esc>", "Close"),
  H      = exec(":Telescope highlights", "Highlights"),
  h      = exec(":Telescope help_tags", "Help tags"),
  m      = exec(":Telescope man_pages", "Manual pages"),
}


-- ----------------------------------------------------------------------------
-- LSP Mappings
-- ----------------------------------------------------------------------------
-- TODO: set map for lsp
map.l    = {
  name   = "LSP",
  [" "]  = exec("<Esc>", "Close"),
  ["."]  = "Lsp finder Ref & Def",
  h      = "Hover documentation",
  H      = "Help",
  n      = "Diagnostics next",
  p      = "Diagnostics prev",
  d      = "Definitions",
  D      = "Declaration",
  t      = "Type definitions",
  i      = "Implementation",
  R      = "Rename",
  f      = "Format",
  a      = "Code action",
  x      = "Show line diagnostics",
  X      = "Show cursor diagnostics",
  w      = {
    name   =                                      "Workspace action",
    [" "]  = { "<Esc>",                           "Close"                  },
    a    =                                        "Add workspace folder",
    r    =                                        "Remove workspace folder",
    l    =                                        "List workspace",
  },
}


-- ----------------------------------------------------------------------------
-- Motion Mappings
-- ----------------------------------------------------------------------------
map.m    = {
  name   = "Motion",
  [" "]  = exec("<Esc>", "Close"),
  w      = exec(":HopWord", "Hop word" ),
  p      = exec(":HopPattern", "Hop pattern" ),
  l      = exec(":HopLine", "Hop line" ),
  c      = exec(":HopChar1",  "Hop char 1" ),
  C      = exec(":HopChar2",  "Hop char 2" ),
}


-- ----------------------------------------------------------------------------
-- Open Mappings
-- ----------------------------------------------------------------------------
map.o    = {
  name   = "Open",
  [" "]  = exec("<Esc>", "Close"),
  e      = exec(":NvimTreeToggle", "File explorer" ),
  m      = execm(":MinimapToggle", "Open minimap", "Minimap" ),
  -- M      = execm(":GonvimMarkdown", "Open markdown", "Markdown preview" ),
  t      = exec(":ToggleTerm dir=git_dir<cr>", "Terminal" ),
  T      = exec(":ToggleTerm dir=git_dir direction=tab <cr>", "Terminal in new tab" ),
  d      = execm(":Dashboard<cr>", "Open dashboard", "Dasboard" ),
}


-- ----------------------------------------------------------------------------
-- Plugin Mappings
-- ----------------------------------------------------------------------------
map.p    = {
  name   = "Plugin",
  [" "]  = exec("<Esc>", "Close"),
  C      = exec(":PackerClean",  "Clean" ),
  c      = execm(":PackerCompile", "Plugin compiled", "Compile" ),
  i      = execm(":PackerInstall", "Plugin install", "Install" ),
  s      = execm(":PackerSync", "Sync Plugin", "Sync" ),
  u      = execm(":PackerUpdate", "Update Plugin", "Update" ),
}


-- ----------------------------------------------------------------------------
-- Search Mappings
-- ----------------------------------------------------------------------------
-- Skip lsp picker use lsp saga instead
map.s    = {
  name   = "Search",
  [" "]  = exec("<Esc>", "Close"),

  -- File pickers
  ["."]  = exec(":Telescope live_grep", "String in current directory" ),
  ["'"]  = exec(":Telescope grep_string", "String under the cursor" ),
  f      = exec(":Telescope find_files", "Find files" ),
  F      = exec(":Telescope file_browser", "File browser" ),
  g      = exec(":Telescope git_files","Git files" ),

  -- Vim Pickers
  b      = exec(":Telescope buffers", "Buffers" ),
  h      = exec(":Telescope oldfiles", "Previously open files" ),
  c      = exec(":Telescope commands", "Commands" ),
  C      = exec(":Telescope command_history", "Commands history" ),
  s      = exec(":Telescope current_buffer_fuzzy_find", "Current buffer fuzzy find" ),
  S      = exec(":Telescope search_history", "Search history" ),
  m      = exec(":Telescope marks", "Marks" ),
  j      = exec(":Telescope jumplist", "Jumplist" ),
  o      = exec(":Telescope vim_options", "Vim Options" ),
  r      = exec(":Telescope registers", "Registers" ),
  k      = exec(":Telescope keymaps", "Keymaps" ),
  [";"]  = exec(":Telescope filetypes", "Filetypes" ),

  -- Treesitter
  T      = exec(":Telescope treesitter", "TODOs" ),

  -- Custom Search and External Plugin
  t      = exec(":TodoTelescope", "TODOs" ),
}


-- ----------------------------------------------------------------------------
-- Trouble Mappings
-- ----------------------------------------------------------------------------
map.t    = {
  name   = "Trouble Lsp",
  [" "]  = exec("<Esc>", "Close"),
  r      = "References",
  q      = "Quickfix",
  l      = "Loclist",
  w      = "Workspace diagnostics",
  d      = "Document diagnostics",
}


-- ----------------------------------------------------------------------------
-- Window Mappings
-- ----------------------------------------------------------------------------
map.w    = {
  name   = "Window",
  [" "]  = exec("<Esc>", "Close"),
  H      = execm(":vertical resize -5", "", "Resize vertical"),
  L      = execm(":vertical resize +5", "", "Resize vertical"),
  J      = execm(":resize -5", "", "Resize horizontal"),
  K      = execm(":resize +5", "", "Resize horizontal"),
  h      = execm("<C-w>h", "Move to left window", "Move left"),
  j      = execm("<C-w>j", "Move to bottom window", "Move down"),
  k      = execm("<C-w>k", "Move to top window", "Move up"),
  l      = execm("<C-w>l", "Move to right window", "Move right"),
  D      = execm("<C-w>o", "Other window closed", "Close other window"),
  d      = execm("<C-w>c", "Window closed", "Close current window"),
  n      = execm("<C-w>w", "Move to next window", "Next window"),
  p      = execm("<C-w>p", "Move to previous window", "Prev window"),
  S      = execm(":new", "New window buffer", "New window buffer"),
  V      = execm(":vnew", "New vertical window buffer", "New vertical window buffer"),
  s      = execm(":split", "Split horizontal", "Horizontal split"),
  v      = execm(":vsplit", "Split vertical", "Vertical split"),
}


wk.register(map, { prefix = '<leader>' })

