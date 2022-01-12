;; Module contains core.editor commands

(local tsv (require :lib.tsukivim))

(fn no-highlight-search []
  "no highlight search"
  (tsv.cmd "let @/ = ''"))

(fn toggle-number-line []
  "toggle number line"
  (tsv.notify.info "Number line toggled" "Editor: toggle number line")
  (tsv.cmd "set invnumber"))

(fn toggle-relative-number []
  "toggle relative number line"
  (tsv.notify.info "Relative number line toggled" 
               "Editor: toggle relative number")
  (tsv.cmd "set invrelativenumber"))

;; TODO: remove enter, add action to ask if user want to save the file
(fn quit []
  "Quit tsukivim"
  (let [(ok? err) (pcall tsv.cmd :q)]
    (when (not ok?)
      (tsv.notify.error err "Editor: quit"))))

(fn force-quit []
  "Force quit tsukivim"
  (tsv.cmd :q!))

(fn save-file []
  "Save file"
  (tsv.notify.info "File saved." "Editor: save")
  (tsv.cmd :w))

(fn save-file-and-quit []
  "Save file and quit tsukivim"
  (tsv.cmd :wq))

{: no-highlight-search
 : toggle-number-line
 : toggle-relative-number
 : quit
 : force-quit
 : save-file
 : save-file-and-quit}
