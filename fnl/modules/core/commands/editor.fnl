;; Module contains core.editor commands

(local tsv (require :lib.tsukivim))

(fn no-highlight-search []
  "no highlight search"
  (tsv.cmd "let @/ = ''"))

(fn toggle-number-line []
  "toggle number line"
  (tsv.notify.info "Number line toggled" 
                   [:fn:toggle-number-line :modules.core.commands.editor])
  (tsv.cmd "set invnumber"))

(fn toggle-relative-number []
  "toggle relative number line"
  (tsv.notify.info "Relative number line toggled" 
                   [:fn:toggle-relative-number :modules.core.commands.editor])
  (tsv.cmd "set invrelativenumber"))

(fn check-health []
  "check neovim health"
  (tsv.cmd :checkhealth))

(fn current-work-directory []
  "Get current word directory and print it to notify"
  (tsv.notify.info (vim.fn.getcwd) 
                   [:fn:current-word-directory 
                    :modules.core.commands.editor]))

;; FIX: handle error when not saved
(fn quit []
  "Quit tsukivim"
  (let [(ok? err) (pcall tsv.cmd :q)]
    (when (not ok?)
      (tsv.notify.error err 
                        [:fn:quit :modules.core.commands.editor]))))

(fn force-quit []
  "Force quit tsukivim"
  (tsv.cmd :q!))

(fn save-file []
  "Save file"
  (tsv.notify.info "File saved." 
                   [:fn:save-file :modules.core.commands.editor])
  (tsv.cmd :w))

(fn save-file-and-quit []
  "Save file and quit tsukivim"
  (tsv.cmd :wq))

{: no-highlight-search
 : toggle-number-line
 : toggle-relative-number
 : check-health
 : current-work-directory
 : quit
 : force-quit
 : save-file
 : save-file-and-quit}
