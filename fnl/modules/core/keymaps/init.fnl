;; Module for tsukivim keymaps

(local tsv (require :lib.tsukivim))

(local close [:<Esc> :Close])

;; Keymaps <leader> in normal mode
(local keys-normal 
    {" "                   close
     ;; Single keymaps
     :.                    (. (require :modules.utils.telescope.keymaps) 
                              :normal
                              :search
                              :f)
     :q                    (. (require :modules.core.keymaps.editor) 
                              :normal
                              :q)
     :Q                    (. (require :modules.core.keymaps.editor)
                              :normal
                              :Q)
     :<Tab>                (. (require :modules.ui.bufferline.keymaps)
                              :normal
                              :n)
     
     :<S-Tab>                (. (require :modules.ui.bufferline.keymaps)
                                :normal
                                :p)
     
     ;; Actions
     :a                    (. (require :modules.core.keymaps.actions) :normal)
     
     ;; Buffer
     :b                    (. (require :modules.ui.bufferline.keymaps) :normal)
     
     ;; Editor
     :e                    (. (require :modules.core.keymaps.editor) :normal)
     
     ;; Files
     :f                    (. (require :modules.core.keymaps.file) :normal)
     
     ;; Git
     :g                    (. (require :modules.core.keymaps.git) :normal)
     
     ;; Help
     :H                    (. (require :modules.utils.telescope.keymaps)
                              :normal
                              :help)
     
     ;; Hop
     :h                    (. (require :modules.editing.hop.keymaps) :normal)
     
     ;; Open
     :o                    (. (require :modules.core.keymaps.open) :normal)
     
     ;; Packer plugin
     :P                    (. (require :modules.core.keymaps.plugin) :normal)
     
     ;; Prejects
     :p                    (. (require :modules.utils.telescope.keymaps)
                              :normal
                              :projects)
     
     ;; Search
     :s                    (. (require :modules.utils.telescope.keymaps)
                              :normal
                              :search)

     :x                   (. (require :modules.utils.todo-comments.keymaps) 
                             :normal)
     
     ;; Window
     :w                   (. (require :modules.core.keymaps.window) :normal)})

(local keys-visual
    {:q                    (. (require :modules.core.keymaps.editor) :visual :q)
     :Q                    (. (require :modules.core.keymaps.editor) :visual :Q)
     :a                    (. (require :modules.core.keymaps.actions) :visual)
     :e                    (. (require :modules.core.keymaps.editor) :visual)})

(local whichkey-config 
  {:key_labels {:<space> :SPC 
                :<cr> :RET
                :<bs> :BACKSPC
                :<esc> :ESC
                :<Tab> :TAB
                :<S-Tab> :S-TAB} 
   :layout {:align :center}})

(let [(ok? whichkey) (tsv.require-plugin :which-key)
      opts {:prefix :<leader>}
      key-opts {:noremap true}]
  (if ok?
     ;; Disable Arrow keys
     (do (tsv.set-keymap :i :<Up> :<NOP> key-opts)
         (tsv.set-keymap :i :<Down> :<NOP> key-opts)
         (tsv.set-keymap :i :<Right> :<NOP> key-opts)
         (tsv.set-keymap :i :<Left> :<NOP> key-opts)
         (tsv.set-keymap :n :<Up> :<NOP> key-opts)
         (tsv.set-keymap :n :<Down> :<NOP> key-opts)
         (tsv.set-keymap :n :<Right> :<NOP> key-opts)
         (tsv.set-keymap :n :<Left> :<NOP> key-opts)
     
         ;; consisten jump in middle
         (tsv.set-keymap :n :n :nzz key-opts)
         (tsv.set-keymap :n :N :Nzz key-opts)
     
         ;; set timeout length for which-key
         (tsv.set-global :timeoutlen 200)
     
         ;; set <leader> to <space>
         (tsv.let-global :mapleader " ")
     
         (whichkey.setup whichkey-config)
         (whichkey.register keys-normal {:prefix :<leader>})
         (whichkey.register keys-visual {:prefix :<leader> :mode :v}))
     
     :otherwise (tsv.notify.error whichkey
                                  [:module :modules.core.keymaps.init])))

