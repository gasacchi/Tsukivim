;; Module that contains some helper and vim function wrapper
(fn require-plugin [name]
  "Accept name of plugin, try to require it with pcall"
  (pcall require name))

(fn set-option [key val]
  "Accept option key & val then set option with vim.opt"
  (tset vim.opt key val))

(fn set-global [key val]
  "Accept option key & val then set global scoped option with vim.go"
  (tset vim.go key val))

(fn set-buffer [key val]
  "Accept option key & val then set buffer scoped option with vim.go"
  (tset vim.bo key val))

(fn set-window [key val]
  "Accept option key & val then set window scoped option with vim.g"
  (tset vim.wo key val))

(fn let-global [key val]
  "Accept global key & val then set global key with vim.g"
  (tset vim.g key val))

(fn set-keymap [mode key cmd opts]
  "Accept mode 'i,n,v etc.' for key map
   key to trigger the command
   cmd command to run when key triggered
   and additional options"
  (vim.api.nvim_set_keymap mode key cmd opts))

(fn set-buffer-keymap [buffnumber mode key cmd opts]
  "Accept buffer number
   mode 'i,n,v etc.' for key map
   key to trigger the command
   cmd command to run when key triggered
   and additional options"
  (vim.api.nvim_buf_set_keymap mode key cmd opts))

(fn cmd [c]
  "Accept string of VimL and run it"
  (vim.cmd c))

{: cmd
 : set-option
 : set-global
 : set-buffer
 : set-window
 : set-keymap
 : set-buffer-keymap
 : let-global
 : require-plugin
 : set-option}
 
