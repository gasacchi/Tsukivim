;; Module that contains some helper and vim function wrapper
(local tsukivim {})

(fn tsukivim.require-plugin [name]
  "Accept name of plugin, try to require it with pcall"
  (pcall require name))

(fn tsukivim.set-option [key val]
  "Accept option key & val then set option with vim.opt"
  (tset vim.opt key val))

(fn tsukivim.set-global [key val]
  "Accept option key & val then set global scoped option with vim.go"
  (tset vim.go key val))

(fn tsukivim.set-buffer [key val]
  "Accept option key & val then set buffer scoped option with vim.go"
  (tset vim.bo key val))

(fn tsukivim.set-window [key val]
  "Accept option key & val then set window scoped option with vim.g"
  (tset vim.wo key val))

(fn tsukivim.get-option [key]
  "get global scoped option with given key"
  (. vim.go key))

(fn tsukivim.get-buffer-option [key]
  "get buffer scoped option with given key"
  (. vim.bo key))

(fn tsukivim.get-window-option [key]
  "get window scoped option with given key"
  (. vim.wo key))

(fn tsukivim.let-global [key val]
  "Accept global key & val then set global key with vim.g"
  (tset vim.g key val))

(fn tsukivim.set-keymap [mode key cmd opts]
  "Accept mode 'i,n,v etc.' for key map
   key to trigger the command
   cmd command to run when key triggered
   and additional options"
  (vim.api.nvim_set_keymap mode key cmd opts))

(fn tsukivim.set-buffer-keymap [buffnumber mode key cmd opts]
  "Accept buffer number
   mode 'i,n,v etc.' for key map
   key to trigger the command
   cmd command to run when key triggered
   and additional options"
  (vim.api.nvim_buf_set_keymap mode key cmd opts))

(fn tsukivim.cmd [c]
  "Accept string of VimL and run it"
  (vim.cmd c))

(fn tsukivim.load-plugin [name]
  "Manualy load plugin, use for lazy loaded plugin"
  (tsukivim.cmd (.. "packadd " name)))

(tset tsukivim :notify {})

(fn tsukivim.notify.error [msg ?title ?opts]
  "Accept message and title and pass to notify.nvim as error notification
  fallback to native vim.notify if notify.nvim not installed"
  (let [(ok? n) (tsukivim.require-plugin :notify)
        default-options {:title (or ?title :ERROR)
                         :keep (lambda [] true)}]
    (if ok? 
      (n.notify msg "error" (or ?opts default-options))
      (vim.notify msg vim.log.levels.ERROR))))

(fn tsukivim.notify.info [msg ?title ?opts]
  "Accept message and title and pass to notify.nvim as info notification
  fallback to native vim.notify if notify.nvim not installed"
  (let [(ok? n) (tsukivim.require-plugin :notify)
        default-options {:title (or ?title :INFO)
                         :timeout 1000}]
    (if ok? 
      (n.notify msg "info" (or ?opts default-options))
      (vim.notify msg vim.log.levels.INFO))))

(fn tsukivim.notify.warn [msg ?title ?opts]
  "Accept message and title and pass to notify.nvim as warning notification
  fallback to native vim.notify if notify.nvim not installed"
  (let [(ok? n) (tsukivim.require-plugin :notify)
        default-options {:title (or ?title :WARN)
                         :timout 3000}]
    (if ok? 
      (n.notify msg "warn" (or ?opts default-options))
      (vim.notify msg vim.log.levels.WARN))))

(fn tsukivim.notify.debug [msg ?title ?opts]
  "Accept message and title and pass to notify.nvim as debug notification
  fallback to native vim.notify if notify.nvim not installed"
  (let [(ok? n) (tsukivim.require-plugin :notify)
        default-options {:title (or ?title :DEBUG)
                         :timeout 4000}]
    (if ok? 
      (n.notify msg "debug" (or ?opts default-options))
      (vim.notify msg vim.log.levels.DEBUG))))

(fn tsukivim.notify.trace [msg ?title ?opts]
  "Accept message and title and pass to notify.nvim as trace notification
  fallback to native vim.notify if notify.nvim not installed"
  (let [(ok? n) (tsukivim.require-plugin :notify)
        default-options {:title (or ?title :TRACE)
                         :timout 4000}]
    (if ok? 
      (n.notify msg "trace" (or ?opts {:title :TRACE
                                       :timout 4000}))
      (vim.notify msg vim.log.levels.TRACE))))

(fn tsukivim.todo [fn-name]
  (tsukivim.notify.error fn-name "TODO not implemented"))

tsukivim
 
