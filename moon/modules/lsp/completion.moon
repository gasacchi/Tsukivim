import cmd,o from vim
import col, getline, pumvisible from vim.fn
import nvim_set_keymap,nvim_replace_termcodes from vim.api

import setup from require "compe"

-- https://github.com/hrsh7th/nvim-compe/issues/296
compe_setup =
  enabled:          true
  autocomplete:     true
  debug:            false
  min_length:       1
  preselect:        "enable"
  throttle_time:    80
  source_timeout:   200
  incomplete_delay: 400
  max_abbr_width:   100
  max_kind_width:   100
  max_menu_width:   100
  documentation:    true
  source: 
    path:           true
    buffer:         true
    calc:           true
    nvim_lsp:       true
    nvim_lua:       true

setup compe_setup

t = (str) -> nvim_replace_termcodes str, true, true, true

check_back_space = ->
  cl = col"." - 1
  if cl == 0 or getline(".")\sub(cl,cl)\match("%s")
    return true
  else
    return false

-- Use (s-)tab to:
-- move to prev/next item in completion menuone
-- jump to prev/next snippet's placeholder
_G.tab_complete = ->
  if pumvisible! == 1
    return t "<C-n>"
  --[[ elseif vim.fn.call("vsnip#available", {1}) == 1 then
    -- return t "<Plug>(vsnip-expand-or-jump)" ]]
  elseif check_back_space!
    return t "<Tab>"
  else
    return vim.fn['compe#complete']!

_G.s_tab_complete = ->
  if pumvisible! == 1
    return t "<C-p>"
  --[[ elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    -- return t "<Plug>(vsnip-jump-prev)" ]]
  else
    return t "<S-Tab>"


nvim_set_keymap "i", "<Tab>",   "v:lua.tab_complete()",   expr: true
nvim_set_keymap "s", "<Tab>",   "v:lua.tab_complete()",   expr: true
nvim_set_keymap "i", "<S-Tab>", "v:lua.s_tab_complete()", expr: true
nvim_set_keymap "s", "<S-Tab>", "v:lua.s_tab_complete()", expr: true

cmd "inoremap <silent><expr> <C-Space> compe#complete()"
cmd "inoremap <silent><expr> <CR>      compe#confirm('<CR>')"
cmd "inoremap <silent><expr> <C-e>     compe#close('<C-e>')"
cmd "inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })"
cmd "inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })"

o.completeopt = "menuone,noselect"
