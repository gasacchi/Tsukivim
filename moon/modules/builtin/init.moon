-- reimport neovim builtin api for lua 
import o, bo, wo, w, cmd, g from vim
import nvim_set_keymap, nvim_exec from vim.api

command = (c) -> cmd c


set =
  o: (opt, val) ->
    o[opt] = val
  wo: (opt, val) ->
    wo[opt] = val
  bo: (opt, val) ->
    bo[opt] = val
  w: (opt, val) ->
    w[opt] = val

let = (name) -> (val) ->
  g[name] = val


api =
  keymap: (...) ->
    -- agrs: mode, from, to, opts
    nvim_set_keymap ...
  exec: (chunk, ret) ->
    nvim_exec chunk, ret
  
{ :set
  :api
  :let
  :cmd }

