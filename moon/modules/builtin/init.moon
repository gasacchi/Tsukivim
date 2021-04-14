-- reimport neovim builtin api for lua 
import o, bo, wo, w, cmd, g, fn from vim
import nvim_set_keymap, nvim_exec, nvim_set_var from vim.api

cmd = (c) -> vim.cmd c

set =
  o: (opt, val) ->
    o[opt] = val
  wo: (opt, val) ->
    wo[opt] = val
  bo: (opt, val) ->
    bo[opt] = val
  w: (opt, val) ->
    w[opt] = val

let = (name, val) ->
  g[name] = val

get = (name) ->
  g[name]

api =
  keymap: (mode, from_, to, opts) ->
    -- agrs: mode, from, to, opts
    nvim_set_keymap mode, from_, to, opts
  exec: (chunk, ret) ->
    nvim_exec chunk, ret
  var: (name, val) ->
    nvim_set_var name, val
  
{ :set
  :fn
  :get
  :api
  :let
  :cmd }

