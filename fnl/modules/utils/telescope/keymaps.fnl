;; Module contians telescope keymaps

(local telescope-cmd (require :modules.utils.telescope.commands))

{:search {:name :Search
          " " [:<Esc> :Close]
       ;; File picker
          :.  [telescope-cmd.grep-string    :Search-string-under-cursor]
          :S  [telescope-cmd.live-grep      :Search-string-in-current-dir]
          :f  [telescope-cmd.find-files     :Find-file-in-current-dir]
          :g  [telescope-cmd.git-files      :Find-git-files]
          :s  [telescope-cmd.current-buffer-fuzzy-find 
               :Search-string-in-current-buffer]

          ;; Vim picker
          :C  [telescope-cmd.command-history  :List-command-history]
          :H  [telescope-cmd.search-history   :Search-history]
          :b  [telescope-cmd.buffers          :Search-buffers]
          :h  [telescope-cmd.recent-files     :Search-recent-files]
          :m  [telescope-cmd.marks            :List-marks]
          :r  [telescope-cmd.registers        :List-registers]}
 
 :help   {:name :Help
          " " [:<Esc> :Close]
          :H  [telescope-cmd.highlights       :List-highlights]
          :a  [telescope-cmd.autocommands     :List-autocommands]
          :c  [telescope-cmd.commands         :List-commands]
          :f  [telescope-cmd.filetypes        :List-filetypes]
          :h  [telescope-cmd.help-tags        :Help-tags]
          :k  [telescope-cmd.keymaps          :Search-recent-files]
          :m  [telescope-cmd.man-pages        :Man-pages]
          :o  [telescope-cmd.vim-options      :List-vim-options]}
 
 :projects {:name :Projects
            " " [:<Esc> :Close]
            :s  [telescope-cmd.projects       :Projects-search]}}
          
