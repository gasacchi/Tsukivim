;; Module contains packer commands

(local tsv (require :lib.tsukivim))

(fn compile []
  "Compile plugins.fnl to packer_compiled.lua"
  (tsv.cmd "PackerCompile profile=true")
  (tsv.notify.info "plugins.fnl file compiled." 
                   [:fn:compile :modules.core.commands.plugin]))

(fn clean []
  "Clean un-used plugins in plugins.fnl"
  (tsv.cmd :PackerClean)
  (tsv.notify.info "Plugin cleaned." 
                   [:fn:clean :modules.core.commands.plugin]))

(fn install []
  "Install plugin declared in plugins.fnl"
  (tsv.cmd :PackerInstall))

(fn sync []
  "todo"
  (tsv.cmd :PackerSync))

(fn status []
  "Show packer status"
  (tsv.cmd :PackerStatus))

(fn update []
  "Update plugins"
  (tsv.cmd :PackerUpdate))

(fn profile []
  (tsv.cmd :PackerProfile))

{: compile
 : clean
 : install
 : sync
 : status
 : update
 : profile}
