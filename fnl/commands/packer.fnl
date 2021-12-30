;; Module contains packer command
(local {: cmd} (require :lib.tsukivim))

(local packer-commands {})

(fn packer-commands.compile []
  "Compile plugins.fnl to packer_compiled.lua"
  (cmd "PackerCompile profile=true"))

(fn packer-commands.clean []
  "Clean un-used plugins in plugins.fnl"
  (cmd :PackerClean))

(fn packer-commands.install []
  "Install plugin declared in plugins.fnl"
  (cmd :PackerInstall))

(fn packer-commands.sync []
  "todo"
  (cmd :PackerSync))

(fn packer-commands.status []
  "Show packer status"
  (cmd :PackerStatus))

(fn packer-commands.update []
  "Update plugins"
  (cmd :PackerUpdate))

(fn packer-commands.profile []
  (cmd :PackerProfile))

packer-commands

