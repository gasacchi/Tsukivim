;; Modules contains keymaps for packer

(local plugin-cmd (require :modules.commands.plugin))

{:normal 
 {:name :Plugins
  " " [:<Esc>                   :Close]
  :c  [plugin-cmd.compile       :Packer-plugin-compile]
  :C  [plugin-cmd.clean         :Packer-plugin-clean]
  :i  [plugin-cmd.install       :Packer-plugin-install]
  :s  [plugin-cmd.sync          :Packer-plugin-sync]
  :S  [plugin-cmd.status        :Packer-plugin-status]
  :u  [plugin-cmd.update        :Packer-plugin-update]
  :p  [plugin-cmd.profile       :Packer-plugin-profile]}}

