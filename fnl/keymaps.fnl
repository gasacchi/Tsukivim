;; Module for configure keymaps
(import-macros {: set-keymap! : let-global! : set-global!} :lib.macro.vim)

(local {: require-plugin} (require :lib.tsukivim))

(local {:buffer buffer-cmd
        :editor editor-cmd
        :git git-cmd
        :lsp lsp-cmd
        :packer packer-cmd
        :telescope telescope-cmd
        :window window-cmd} (require :commands))


(fn cmd [command ?without-enter]
  (if ?without-enter
    (.. :: command)
    (.. :: command :<cr>)))

(fn setup []
  "Function that run before which-key loaded"
  (let [opts {:noremap true}]
    ;; Disable Arrow keys
    (set-keymap! :i :<Up> :<NOP> opts)
    (set-keymap! :i :<Down> :<NOP> opts)
    (set-keymap! :i :<Right> :<NOP> opts)
    (set-keymap! :i :<Left> :<NOP> opts)
    (set-keymap! :n :<Up> :<NOP> opts)
    (set-keymap! :n :<Down> :<NOP> opts)
    (set-keymap! :n :<Right> :<NOP> opts)
    (set-keymap! :n :<Left> :<NOP> opts)

    ;; consisten jump in middle
    (set-keymap! :n :n :nzz opts)
    (set-keymap! :n :N :Nzz opts)

    ;; set timeout length for which-key
    (set-global! :timeoutlen 300)
    ;; Set <leader> to <space>
    (let-global! :mapleader " ")))

;; Keymaps rules here
(local keys {})

;; Single keymaps
(tset keys " "      [:<Esc>                         :Close])
(tset keys :.       [telescope-cmd.find-files       :Find-file])
(tset keys :q       [editor-cmd.quit                :Quit])
(tset keys :Q       [editor-cmd.force-quit          :Force-Quit])
(tset keys :<Tab>   [buffer-cmd.cycle-next          :Goto-next-buffer])
(tset keys :<S-Tab> [buffer-cmd.cycle-prev          :Goto-prev-buffer])
(tset keys :x       [telescope-cmd.test             :Goto-prev-buffer])

;; Action keymaps
;; TODO: add S-exp action jump
;; :y  ["\"+y" :Yank-to-clipboard] ;; TODO: move to visual keymap
(tset keys :a 
      {:name :Actions
       " " [:<Esc>                                  :Close]
       :p  ["\"+p"                                  :Paste-from-clipboard]})

;; Buffer keymaps
(tset keys :b 
      {:name :Buffers
       " " [:<Esc>                                  :Close]
       :b  [buffer-cmd.pick-buffer                  :Pick-goto-buffer]
       :d  [buffer-cmd.delete-buffer                :Delete-current-buffer]
       :D  [buffer-cmd.pick-and-close-buffer        :Pick-delete-buffer]
       :f  [buffer-cmd.first-buffer                 :Goto-first-buffer]
       :l  [buffer-cmd.last-buffer                  :Goto-last-buffer]
       :n  [buffer-cmd.cycle-next                   :Goto-next-buffer]
       :p  [buffer-cmd.cycle-prev                   :Goto-prev-buffer]
       :s  [telescope-cmd.buffers                   :Search-buffer]
       :1  [(buffer-cmd.goto-buffer 1)              :Goto-buffer-1]
       :2  [(buffer-cmd.goto-buffer 2)              :Goto-buffer-2]
       :3  [(buffer-cmd.goto-buffer 3)              :Goto-buffer-3]
       :4  [(buffer-cmd.goto-buffer 4)              :Goto-buffer-4]
       :5  [(buffer-cmd.goto-buffer 5)              :Goto-buffer-5]
       :6  [(buffer-cmd.goto-buffer 6)              :Goto-buffer-6]
       :7  [(buffer-cmd.goto-buffer 7)              :Goto-buffer-7]
       :8  [(buffer-cmd.goto-buffer 8)              :Goto-buffer-8]
       :9  [(buffer-cmd.goto-buffer 9)              :Goto-buffer-9]})

;; Editor keymaps
(tset keys :e 
      {:name :Editors
       " " [:<Esc>                              :Close]
       ;; TODO: set keymaps for eval fennel
       :h  [editor-cmd.no-highlight-search      :No-highlight-searc]
       :n  [editor-cmd.toggle-number-line       :Toggel-number-line]
       :r  [editor-cmd.toggle-relative-number   :Toggel-relative-number-line]
       :s  [editor-cmd.startup-time             :Run-profiling-startup-time]})

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
(tset keys :h 
      {:name :Help
       " " [:<Esc> :Close]
       :h  [telescope-cmd.help-tags      :Help-tags]
       :m  [telescope-cmd.man-pages      :Man-pages]})

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
        :e    [editor-cmd.toggle-nvim-tree   :Toggle-file-tree]})

;; Open keymaps
(tset keys :p
       {:name :Plugin
        " "   [:<Esc>                  :Close]
        :c    [packer-cmd.compile      :Packer-compile]
        :C    [packer-cmd.clean        :Packer-clean]
        :i    [packer-cmd.install      :Packer-install]
        :s    [packer-cmd.sync         :Packer-sync]
        :S    [packer-cmd.status       :Packer-status]
        :u    [packer-cmd.update       :Packer-update]
        :p    [packer-cmd.profile      :Packer-profile]})

;; Search keymaps
;; TODO: make custom picker and use ivy like layout
(tset keys :s
      {:name :Search
       " " [:<Esc> :Close]
       ;; File picker
       :.  [telescope-cmd.grep-string    :Search-string-under-cursor]
       :F  [telescope-cmd.file-browser   :File-browser]
       :S  [telescope-cmd.live-grep      :Search-string-in-current-dir]
       :f  [telescope-cmd.find-files     :Find-file-in-current-dir]
       :g  [telescope-cmd.git-files      :Find-git-files]
       :s  [telescope-cmd.current-buffer-fuzzy-find
            :Search-string-in-current-buffer]

       ;; Vim picker
       ";" [telescope-cmd.filetypes        :List-filetypes]
       "," [telescope-cmd.highlights       :List-highlights]
       :C  [telescope-cmd.command-history  :List-command-history]
       :H  [telescope-cmd.search-history   :Search-history]
       :a  [telescope-cmd.autocommands     :List-autocommands]
       :b  [telescope-cmd.buffers          :Search-buffers]
       :c  [telescope-cmd.commands         :List-commands]
       :h  [telescope-cmd.recent-files     :Search-recent-files]
       :k  [telescope-cmd.keymaps          :Search-recent-files]
       :m  [telescope-cmd.marks            :List-marks]
       :o  [telescope-cmd.vim-options      :List-vim-options]
       :r  [telescope-cmd.registers        :List-registers]})

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

(local keys-visual {})

(let [(ok? whichkey) (require-plugin :which-key)
      opts {:prefix :<leader>}
      key-opts {:noremap true}]
  (when ok?
    ;; Disable Arrow keys
   (set-keymap! :i :<Up> :<NOP> key-opts)
   (set-keymap! :i :<Down> :<NOP> key-opts)
   (set-keymap! :i :<Right> :<NOP> key-opts)
   (set-keymap! :i :<Left> :<NOP> key-opts)
   (set-keymap! :n :<Up> :<NOP> key-opts)
   (set-keymap! :n :<Down> :<NOP> key-opts)
   (set-keymap! :n :<Right> :<NOP> key-opts)
   (set-keymap! :n :<Left> :<NOP> key-opts)
   
   ;; consisten jump in middle
   (set-keymap! :n :n :nzz key-opts)
   (set-keymap! :n :N :Nzz key-opts)
   
   ;; set timeout length for which-key
   (set-global! :timeoutlen 300)
   
   ;; set <leader> to <space>
   (let-global! :mapleader " ")
   
   (whichkey.setup whichkey-config)
   (whichkey.register keys opts)))

