;; Module contain tsukivim editor commands
(local {: cmd : notify : get-option : require-plugin} (require :lib.tsukivim)) 

;; Editor related commands
(local editor-commands {})

(fn editor-commands.dismiss-notify []
  "Dismiss all notification"
  (let [(ok? notify) (require-plugin :notify)]
    (when ok?
      (notify.dismiss))))

(fn editor-commands.startup-time []
  "run startuptime profiling"
  (cmd :StartupTime))

(fn editor-commands.no-highlight-search []
  "no highlight search"
  (cmd "let @/ = ''"))

(fn editor-commands.toggle-number-line []
  "toggle number line"
  (notify.info "Number line toggled" "Editor command toggle number line")
  (cmd "set invnumber"))

(fn editor-commands.toggle-relative-number []
  "toggle relative number line"
  (notify.info "Relative number line toggled" 
               "Editor command: toggle relative number")
  (cmd "set invrelativenumber"))

;; TODO: remove enter, add action to ask if user want to save the file
(fn editor-commands.quit []
  "Quit tsukivim"
  (let [(ok? err) (pcall cmd :q)]
    (when (not ok?)
      (notify.error err "Editor command: quit"))))

(fn editor-commands.force-quit []
  "Force quit tsukivim"
  (cmd :q!))

(fn editor-commands.save-file []
  "Save file"
  (notify.info "File saved." "Editor command: save")
  (cmd :w))

(fn editor-commands.save-file-and-quit []
  "Save file and quit tsukivim"
  (cmd :wq))

(fn editor-commands.toggle-nvim-tree []
  "Toggle neovim file tree"
  (cmd :NvimTreeToggle))

(fn editor-commands.open-glow-markdown []
  "Open glow markdown previewer"
  (cmd :Glow))

(tset editor-commands :plugin {})

(fn editor-commands.plugin.compile []
  "Compile plugins.fnl to packer_compiled.lua"
  (cmd "PackerCompile profile=true")
  (notify.info "plugins.fnl file compiled." "Editor.plugin: packer compile"))

(fn editor-commands.plugin.clean []
  "Clean un-used plugins in plugins.fnl"
  (cmd :PackerClean)
  (notify.info "Plugin cleaned." "Editor.plugin: packer clean"))

(fn editor-commands.plugin.install []
  "Install plugin declared in plugins.fnl"
  (cmd :PackerInstall))

(fn editor-commands.plugin.sync []
  "todo"
  (cmd :PackerSync))

(fn editor-commands.plugin.status []
  "Show packer status"
  (cmd :PackerStatus))

(fn editor-commands.plugin.update []
  "Update plugins"
  (cmd :PackerUpdate))

(fn editor-commands.plugin.profile []
  (cmd :PackerProfile))

editor-commands

