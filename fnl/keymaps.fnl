;; Module for configure keymaps
(import-macros {: set-keymap! : let-global! : set-global!} :lib.macro.vim)

(local {: plugin-exist?} (require :lib.tsukivim))

(fn cmd [command ?without-enter]
  (if ?without-enter
    (.. :: command )
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
(tset keys :.       [(cmd "Telescope file_browser") :Find-file])
(tset keys :q       [(cmd :q)                       :Quit])
(tset keys :Q       [(cmd :q!)                      :Force-Quit])
(tset keys :<Tab>   [(cmd :BufferLineCycleNext) :Goto-next-buffer])
(tset keys :<S-Tab> [(cmd :BufferLineCyclePrev) :Goto-prev-buffer])

;; Action keymaps
(tset keys :a 
      {:name :Actions
       " " [:<Esc>                                  :Close]
       :r  [(cmd :LspRestart)                       :Restart-LSP]
       :s  [(cmd :LspStart)                         :Start-LSP]
       :S  [(cmd :LspStop)                          :Stop-LSP]
       :p  ["\"+p"                                  :Paste-from-clipboard]})
       ;; :y  ["\"+y" :Yank-to-clipboard] ;; TODO: move to visual keymap

;; Buffer keymaps
(tset keys :b 
      {:name :Buffers
       " " [:<Esc>                         :Close]
       :b  [(cmd :BufferLinePick)          :Pick&Goto-buffer]
       :d  [(cmd :Bdelete)                 :Delete-current-buffer]
       :D  [(cmd :BufferLinePickClose)     :Pick&Delete-buffer]
       :f  [(cmd :bfirst)                  :Goto-first-buffer]
       :l  [(cmd :blast)                   :Goto-last-buffer]
       :n  [(cmd :BufferLineCycleNext)     :Goto-next-buffer]
       :p  [(cmd :BufferLineCyclePrev)     :Goto-prev-buffer]
       :s  [(cmd "Telescope buffers")      :Search-buffer]
       :1  [(cmd "BufferLineGoToBuffer 1") :Goto-buffer-1]
       :2  [(cmd "BufferLineGoToBuffer 2") :Goto-buffer-2]
       :3  [(cmd "BufferLineGoToBuffer 3") :Goto-buffer-3]
       :4  [(cmd "BufferLineGoToBuffer 4") :Goto-buffer-4]
       :5  [(cmd "BufferLineGoToBuffer 5") :Goto-buffer-5]
       :6  [(cmd "BufferLineGoToBuffer 6") :Goto-buffer-6]
       :7  [(cmd "BufferLineGoToBuffer 7") :Goto-buffer-7]
       :8  [(cmd "BufferLineGoToBuffer 8") :Goto-buffer-8]
       :9  [(cmd "BufferLineGoToBuffer 9") :Goto-buffer-9]})

;; Editor keymaps
(tset keys :e 
      {:name :Editors
       " " [:<Esc>                       :Close]
       ;; TODO: set keymaps for eval fennel
       :h  [(cmd "let @/ = ''")           :No-highlight-searc]
       :n  [(cmd "set invnumber")         :Toggel-number-line]
       :r  [(cmd "set invrelativenumber") :Toggel-relative-number-line]})

;; Files keymaps
(tset keys :f 
      {:name :Files
       " " [:<Esc> :Close]
       :e  [(cmd :e true) :Edit-file]
       :s  [(cmd :w) :Save-file]
       :S  [(cmd :wq) :Save&Exit-file]
       :n  [(cmd :new true) :New-file]
       :N  [(cmd :vnew true) :New-file]})

;; Git keymaps 
(tset keys :g 
      {:name :Git
       " " [:<Esc> :Close]
       :g  [(cmd "Neogit kind=split") :Open-neogit]
       :c  [(cmd "Neogit commit") :Save-file]

       ;; mappirng form gitsigns 
       ;; see: modules/git/gitsigns.fnl
      :n :Goto-next-hunk
      :p :Goto-prev-hunk
      :s :Stage-hunk
      :u :Undo-stage-hunk
      :r :Reset-hunk
      :R :Reseet-buffer
      :P :Preview-hunk
      :b :Blame-line})

;; Help keymaps 
(tset keys :h 
      {:name :Help
       " " [:<Esc> :Close]
       :h  [(cmd ":Telescope help_tags") :Help-tags]
       :m  [(cmd ":Telescope man_pages") :Man-pages]})

;; LSP keymaps
;; see: modules/lsp/init.fnl
(tset keys :l 
      {:name :LSP
       " "  [:<Esc> :Close]
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
(tset keys :m
       {:name :Marks
        " "   [:<Esc> :Close]
        :.    [(cmd "<Plug>(Marks-setnext)") :Set-mark]
        })

;; Open keymaps
(tset keys :o
       {:name :Open
        " "   [:<Esc>                  :Close]
        :e    [(cmd :NvimTreeToggle)   :Toggle-file-tree]
        :m    [(cmd :GonvimMiniMap)    :Toggle-minimap]
        :M    [(cmd :GonvimMarkdown)   :Toggle-markdown]})

;; Open keymaps
(tset keys :p
       {:name :Plugin
        " "   [:<Esc>                  :Close]
        :c    [(cmd :PackerCompile)    :Packer-compile]
        :C    [(cmd :PackerClean)      :Packer-clean]
        :i    [(cmd :PackerInstall)    :Packer-install]
        :s    [(cmd :PackerSync)       :Packer-sync]
        :S    [(cmd :PackerStatus)     :Packer-status]
        :u    [(cmd :PackerUpdate)     :PackerUpdate]})

;; Search keymaps
(tset keys :s
      {:name :Search
       " " [:<Esc> :Close]
       })

;; Windows keymaps
(tset keys :w
      {:name :Windows
       " " [:<Esc>                     :Close]
       :H  [(cmd "vertical resize -5") :Vertical-resize-]
       :L  [(cmd "vertical resize +5") :Vertical-resize+]
       :J  [(cmd "resize -5")          :Horizontal-resize-]
       :K  [(cmd "resize +5")          :Horizontal-resize+]
       :=  [:<C-w>=                    :Equaly-resize-window]
       :h  [:<C-w>h                    :Goto-left-window]
       :l  [:<C-w>l                    :Goto-right-window]
       :j  [:<C-w>j                    :Goto-bottom-window]
       :k  [:<C-w>k                    :Goto-top-window]
       :n  [:<C-w>w                    :Goto-next-window]
       :p  [:<C-w>p                    :Goto-prev-window]
       :s  [(cmd :split)               :Split-horizontal-window]
       :v  [(cmd :vsplit)              :Split-vertical-window]
       :S  [(cmd :new true)            :New-horizontal-window]
       :V  [(cmd :vnew true)           :New-vertical-window]
       :d  [:<C-w>c                    :Delete-current-window]
       :D  [:<C-w>o                    :Delete-other-window]})

(local whichkey-config 
  {:key_labels {:<space> :SPC 
                :<cr> :RET
                :<bs> :BACKSPC
                :<esc> :ESC
                :<Tab> :TAB
                :<S-Tab> :S-TAB} 
   :layout {:align :center}})

(local keys-visual {})

(fn config []
  "Function that run after which-key is loaded"
  (when (plugin-exist? :which-key.nvim)
    (let [whichkey (require :which-key)
          opts {:prefix :<leader>}]
      (whichkey.setup whichkey-config)
      (whichkey.register keys opts))))

{: config
 : setup}
