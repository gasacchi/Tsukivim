;; Module that contains some helper and vim function wrapper
(fn require-plugin [name]
  "Accept name of plugin, try to require it with pcall"
  (pcall require name))

(fn set-option [opt val]
  "Accept optional key & val then set option with vim.opt"
  (tset vim.opt opt val))

(fn cmd [c]
  "Accept string of VimL and run it"
  (vim.cmd c))
  

{: cmd
 : require-plugin
 : set-option}
 
