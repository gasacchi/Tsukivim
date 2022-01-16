;; Module for tsukivim keymaps

(local tsv (require :lib.tsukivim))

(local close [:<Esc> :Close])

;; Keymaps <leader> in normal mode
(local keys-normal 
  (let [editor-keymaps (require :modules.core.keymaps.editor)
        telescope-keymaps (require :modules.utils.telescope.keymaps)
        bufferline-keymaps (require :modules.ui.bufferline.keymaps)]
    {" "                   close
     ;; Single keymaps
     :.                    telescope-keymaps.normal.search.f
     :q                    editor-keymaps.normal.q
     :Q                    editor-keymaps.normal.Q
     :<Tab>                bufferline-keymaps.normal.n
     :<S-Tab>              bufferline-keymaps.normal.p
     
     ;; Actions
     :a                    (. (require :modules.core.keymaps.actions) :normal)
     
     ;; Buffer
     :b                    bufferline-keymaps.normal
     
     ;; Editor
     :e                    editor-keymaps.normal
     
     ;; Files
     :f                    (. (require :modules.core.keymaps.file) :normal)
     
     ;; Git
     :g                    (. (require :modules.core.keymaps.git) :normal)
     
     ;; Help
     :H                    telescope-keymaps.normal.help
     
     ;; Hop
     :h                    (. (require :modules.editing.hop.keymaps) :normal)
     
     ;; Open
     :o                    (. (require :modules.core.keymaps.open) :normal)
     
     ;; Packer plugin
     :P                    (. (require :modules.core.keymaps.plugin) :normal)
     
     ;; Prejects
     :p                    telescope-keymaps.normal.projects
     
     ;; Search
     :s                    telescope-keymaps.normal.search
     
     ;; Window
     :w                   (. (require :modules.core.keymaps.window) :normal)}))

(local keys-visual
  (let []
    {:a (. (require :modules.core.keymaps.actions) :visual)}))

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

