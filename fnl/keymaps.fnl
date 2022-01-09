;; Module for configure keymaps
(local {: require-plugin
        : set-keymap 
        : set-global
        : notify
        : git-directory?
        : let-global} (require :lib.tsukivim))

(local action-cmd     (require :commands.action))
(local bufferline-cmd (require :modules.ui.bufferline.commands))
(local editor-cmd     (require :commands.editor))
(local git-cmd        (require :commands.git))
(local terminal-cmd   (require :commands.terminal))
(local lsp-cmd        (require :commands.lsp))
(local search-cmd     (require :commands.search))
(local window-cmd     (require :commands.window))

(fn cmd [command ?without-enter]
  (if ?without-enter
    (.. :: command)
    (.. :: command :<cr>)))

;; Keymaps rules here
(local keys {})
(local keys-visual {})


;; Single keymaps
(tset keys " "        [:<Esc>                         :Close])
(tset keys :.         [search-cmd.find-files          :Find-file])
(tset keys :q         [editor-cmd.quit                :Quit])
(tset keys :Q         [editor-cmd.force-quit          :Force-Quit])
(tset keys :<Tab>     [bufferline-cmd.cycle-next          :Goto-next-buffer])
(tset keys :<S-Tab>   [bufferline-cmd.cycle-prev          :Goto-prev-buffer])

;; Action keymaps
;; TODO: add S-exp action jump
;; :y  ["\"+y" :Yank-to-clipboard] ;; TODO: move to visual keymap
(tset keys :a 
      {:name :Actions
       " " [:<Esc>                                  :Close]
       :p  ["\"+p"                                  :Paste-from-clipboard]
       :e  [action-cmd.eval-current-file            :Eval-current-file]
       :s  [action-cmd.source-current-file          :Source-current-file]})

;; Buffer keymaps
(tset keys :b (require :modules.ui.bufferline.keymaps))

;; Editor keymaps
(tset keys :e 
      {:name :Editors
       " " [:<Esc>                              :Close]
       ;; TODO: set keymaps for eval fennel
       :d  [editor-cmd.dismiss-notify           :Dismiss-notifications]
       :h  [editor-cmd.no-highlight-search      :No-highlight-searc]
       :n  [editor-cmd.toggle-number-line       :Toggel-number-line]
       :r  [editor-cmd.toggle-relative-number   :Toggel-relative-number-line]
       :z  [editor-cmd.zen-mode                 :Zen-mode]
       :p {:name :Plugins
            " " [:<Esc>                         :Close]
            :c  [editor-cmd.plugin.compile       :Packer-plugin-compile]
            :C  [editor-cmd.plugin.clean         :Packer-plugin-clean]
            :i  [editor-cmd.plugin.install        :Packer-plugin-install]
            :s  [editor-cmd.plugin.sync          :Packer-plugin-sync]
            :S  [editor-cmd.plugin.status        :Packer-plugin-status]
            :u  [editor-cmd.plugin.update        :Packer-plugin-update]
            :p  [editor-cmd.plugin.profile       :Packer-plugin-profile]}})

;; Files keymaps
(tset keys :f 
      {:name :Files
       " " [:<Esc> :Close]
       :e  [(cmd :e true)                     :Edit-file]
       :s  [editor-cmd.save-file              :Save-file]
       :S  [editor-cmd.save-file-and-quit     :Save&Exit-file]
       :n  [(cmd :new true)                   :New-file]
       :N  [(cmd :vnew true)                  :New-file]})

;; Git keymaps 
(tset keys :g 
      {:name :Git
       " " [:<Esc>                            :Close]
       :g  [git-cmd.open-neogit               :Open-neogit]
       :c  [git-cmd.commit                    :Commit]

       ;; mappirng form gitsigns 
       ;; see: modules/git/gitsigns.fnl
       :n                                     :Goto-next-hunk
       :p                                     :Goto-prev-hunk
       :s                                     :Stage-hunk
       :u                                     :Undo-stage-hunk
       :r                                     :Reset-hunk
       :R                                     :Reseet-buffer
       :P                                     :Preview-hunk
       :b                                     :Blame-line})

;; Help keymaps 
(tset keys :H
      {:name :Help
       " " [:<Esc> :Close]
       :H  [search-cmd.highlights       :List-highlights]
       :a  [search-cmd.autocommands     :List-autocommands]
       :c  [search-cmd.commands         :List-commands]
       :f  [search-cmd.filetypes        :List-filetypes]
       :h  [search-cmd.help-tags        :Help-tags]
       :k  [search-cmd.keymaps          :Search-recent-files]
       :m  [search-cmd.man-pages        :Man-pages]
       :o  [search-cmd.vim-options      :List-vim-options]})

(local hop-keymaps (require :modules.editing.hop.keymaps))
(tset keys :h hop-keymaps)

;; LSP keymaps
;; see: modules/lsp/init.fnl
(tset keys :l 
      {:name :LSP
       " "  [:<Esc> :Close]
       :s   [lsp-cmd.start-server    :Start-LSP]
       :S   [lsp-cmd.stop-server     :Stop-LSP]
       :R   [lsp-cmd.restart-server  :Restart-LSP]
       :.    :Lsp-finder
       :h    :Hover-documentation
       :H    :Help
       :n    :Diagnostics-next
       :p    :Diagnostics-prev
       :d    :Definitions
       :D    :Declacations
       :t    :Type-definitions
       :i    :Implementation
       :R    :Rename
       :f    :Code-Format
       :a    :Code-Action
       :x    :Show-line-diagnostics
       :X    :Show-cursor-diagnostics
       :w    {:name :Workspace-action
              " "   :Close
              :a    :Add-workspace-folder
              :r    :Remove-workspace-folder
              :l    :List-workspaces}}) ;; NOTE: corrections

;; Mark keymaps
;; FIX: for marks or something else?
(tset keys :m
       {:name :Marks
        " "   [:<Esc> :Close]})

;; Open keymaps
(tset keys :o
       {:name :Open
        " "   [:<Esc>                        :Close]
        :e    [editor-cmd.toggle-nvim-tree   :Toggle-file-explorer]
        :m    [editor-cmd.open-glow-markdown :Open-glow-markdown]
        :t    [terminal-cmd.toggle-term      :Toggle-terminal]
        :T    [terminal-cmd.toggle-all-term      :Toggle-terminal]})

;; Projects keymaps
(tset keys :p
       {:name :Projects
        " "   [:<Esc>                        :Close]
        :s    [search-cmd.projects           :Search-projects]})

;; Search keymaps
;; TODO: make custom picker and use ivy like layout
(tset keys :s
      {:name :Search
       " " [:<Esc> :Close]
       ;; File picker
       :.  [search-cmd.grep-string    :Search-string-under-cursor]
       :S  [search-cmd.live-grep      :Search-string-in-current-dir]
       :f  [search-cmd.find-files     :Find-file-in-current-dir]
       :g  [search-cmd.git-files      :Find-git-files]
       :s  [search-cmd.current-buffer-fuzzy-find
            :Search-string-in-current-buffer]

       ;; Vim picker
       :C  [search-cmd.command-history  :List-command-history]
       :H  [search-cmd.search-history   :Search-history]
       :b  [search-cmd.buffers          :Search-buffers]
       :h  [search-cmd.recent-files     :Search-recent-files]
       :m  [search-cmd.marks            :List-marks]
       :r  [search-cmd.registers        :List-registers]})

;; Windows keymaps
(tset keys :w
      {:name :Windows
       " " [:<Esc>                               :Close]
       :H  [window-cmd.decrease-vertical-size    :Decrease-vertical-size]
       :L  [window-cmd.increase-vertical-size    :Incease-vertical-size]
       :J  [window-cmd.decrease-horizontal-size  :Decrease-horizontal-size]
       :K  [window-cmd.increase-horizontal-size  :Increase-horizontal-size]
       :=  [window-cmd.equal-window-size   :Equal-window-size]
       :h  [window-cmd.goto-left                 :Goto-left-window]
       :l  [window-cmd.goto-right                :Goto-right-window]
       :j  [window-cmd.goto-below                :Goto-bottom-window]
       :k  [window-cmd.goto-above                :Goto-top-window]
       :n  [window-cmd.goto-next                 :Goto-next-window]
       :p  [window-cmd.goto-prev                 :Goto-prev-window]
       :s  [window-cmd.horizontal-split          :Split-window-horizontaly]
       :v  [window-cmd.vertical-split            :Split-window-verticaly]
       :S  [(cmd :new true)                      :New-horizontal-window]
       :V  [(cmd :vnew true)                     :New-vertical-window]
       :d  [window-cmd.delete-current-window     :Delete-current-window]
       :D  [window-cmd.delete-other-window       :Delete-other-window]
       :r  [window-cmd.rotate-window-rightwards  :Rotate-rightwards]
       :R  [window-cmd.rotate-window-leftwards   :Rotate-leftwards]
       :x  [window-cmd.exchange                  :Exchange-window]})

(local whichkey-config 
  {:key_labels {:<space> :SPC 
                :<cr> :RET
                :<bs> :BACKSPC
                :<esc> :ESC
                :<Tab> :TAB
                :<S-Tab> :S-TAB} 
   :layout {:align :center}})


(let [(ok? whichkey) (require-plugin :which-key)
      opts {:prefix :<leader>}
      key-opts {:noremap true}]
  (when ok?
    ;; Disable Arrow keys
   (set-keymap :i :<Up> :<NOP> key-opts)
   (set-keymap :i :<Down> :<NOP> key-opts)
   (set-keymap :i :<Right> :<NOP> key-opts)
   (set-keymap :i :<Left> :<NOP> key-opts)
   (set-keymap :n :<Up> :<NOP> key-opts)
   (set-keymap :n :<Down> :<NOP> key-opts)
   (set-keymap :n :<Right> :<NOP> key-opts)
   (set-keymap :n :<Left> :<NOP> key-opts)
   
   ;; consisten jump in middle
   (set-keymap :n :n :nzz key-opts)
   (set-keymap :n :N :Nzz key-opts)
   
   ;; set timeout length for which-key
   (set-global :timeoutlen 200)
   
   ;; set <leader> to <space>
   (let-global :mapleader " ")
   
   (whichkey.setup whichkey-config)
   (whichkey.register keys opts)))

