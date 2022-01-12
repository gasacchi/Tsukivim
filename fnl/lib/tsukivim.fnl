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

(fn get-option [key]
  "get global scoped option with given key"
  (. vim.go key))

(fn get-buffer-option [key]
  "get buffer scoped option with given key"
  (. vim.bo key))

(fn get-window-option [key]
  "get window scoped option with given key"
  (. vim.wo key))

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

(fn load-plugin [name]
  "Manualy load plugin, use for lazy loaded plugin"
  (cmd (.. "packadd " name)))

(fn git-directory? []
  (= (vim.fn.isdirectory :.git) 1))

(fn get-cwd []
  "Get current working directory"
  (vim.fn.getcwd))

(local notify {})

(fn notify.error [msg ?title ?opts]
  "Accept message and title and pass to notify.nvim as error notification
  fallback to native vim.notify if notify.nvim not installed"
  (let [(ok? n) (require-plugin :notify)
        default-options {:title (or ?title :ERROR)
                         :keep (lambda [] true)}]
    (if ok? 
      (n.notify msg "error" (or ?opts default-options))
      :otherwise (vim.notify msg vim.log.levels.ERROR))))

(fn notify.info [msg ?title ?opts]
  "Accept message and title and pass to notify.nvim as info notification
  fallback to native vim.notify if notify.nvim not installed"
  (let [(ok? n) (require-plugin :notify)
        default-options {:title (or ?title :INFO)
                         :timeout 1000}]
    (if ok? 
      (n.notify msg "info" (or ?opts default-options))
      :otherwise (vim.notify msg vim.log.levels.INFO))))

(fn notify.warn [msg ?title ?opts]
  "Accept message and title and pass to notify.nvim as warning notification
  fallback to native vim.notify if notify.nvim not installed"
  (let [(ok? n) (require-plugin :notify)
        default-options {:title (or ?title :WARN)
                         :timout 3000}]
    (if ok? 
      (n.notify msg "warn" (or ?opts default-options))
      :otherwise (vim.notify msg vim.log.levels.WARN))))

(fn notify.debug [msg ?title ?opts]
  "Accept message and title and pass to notify.nvim as debug notification
  fallback to native vim.notify if notify.nvim not installed"
  (let [(ok? n) (require-plugin :notify)
        default-options {:title (or ?title :DEBUG)
                         :timeout 4000}]
    (if ok? 
      (n.notify msg "debug" (or ?opts default-options))
      :otherwise (vim.notify msg vim.log.levels.DEBUG))))

(fn notify.trace [msg ?title ?opts]
  "Accept message and title and pass to notify.nvim as trace notification
  fallback to native vim.notify if notify.nvim not installed"
  (let [(ok? n) (require-plugin :notify)
        default-options {:title (or ?title :TRACE)
                         :timout 4000}]
    (if ok? 
      (n.notify msg "trace" (or ?opts {:title :TRACE
                                       :timout 4000}))
      :otherwise (vim.notify msg vim.log.levels.TRACE))))

(fn todo [fn-name]
  "Accept function name that not yet implemented then send error notification"
  (notify.error fn-name "TODO not implemented"))

{: require-plugin
 : set-option
 : set-global
 : set-buffer
 : set-window
 : get-option
 : get-buffer-option
 : get-window-option
 : let-global
 : set-keymap
 : set-buffer-keymap
 : cmd
 : load-plugin
 : git-directory?
 : get-cmd
 : todo
 : notify}
 
