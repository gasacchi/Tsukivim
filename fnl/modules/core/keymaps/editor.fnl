;; Module contain editor keymaps

(local editor-cmd (require :modules.core.commands.editor))
(local colorizer-cmd (require :modules.ui.colorizer.commands))
(local notify-cmd (require :modules.ui.notify.commands))
(local zen-mode-cmd (require :modules.ui.zen-mode.commands))

{:normal 
 {:name :Editors
   " " [:<Esc>                               :Close]
   :.  [editor-cmd.current-work-directory    :Current-work-directory]
   :c  [colorizer-cmd.toggle                 :Toggle-colorizer]
   :d  [notify-cmd.dismiss                   :Dismiss-notifications]
   :h  [editor-cmd.no-highlight-search       :No-highlight-searc]
   :H  [editor-cmd.check-health              :Check-health]
   :n  [editor-cmd.toggle-number-line        :Toggel-number-line]
   :r  [editor-cmd.toggle-relative-number    :Toggel-relative-number-line]
   :q  [editor-cmd.quit                      :Quit]
   :Q  [editor-cmd.force-quit                :Force-Quit]
   :z  [zen-mode-cmd.toggle                  :Zen-mode-toggle]
   :Z  [zen-mode-cmd.twilight-toggle         :Zen-twilight-toggle]}}

