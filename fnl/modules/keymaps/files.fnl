;; Module for file keymaps

(local editor-cmd (require :modules.commands.editor))

{:normal 
 {:name :file
   :s [editor-cmd.save-file          :Save-file]
   :S [editor-cmd.save-file-and-quit :Save-file-and-quit]}}

