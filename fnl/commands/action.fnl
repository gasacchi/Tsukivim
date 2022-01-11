;; Module contains actions commands
(local {: cmd : todo : notify} (require :lib.tsukivim))

(local action-commands {})

(fn action-commands.eval-file [file]
  "Evaluate given fennel file"
  (cmd (.. "Fnlfile " file))
  (notify.info (.. file " evaluated") "Action: eval-file"))
  

(fn action-commands.eval-current-file []
  "Evaluate current fennel file."
  (let [(ok? err) (pcall cmd "Fnlfile %")]
    (if ok?
      (notify.info "Current file evaluated" "Action: eval-current-file")
      (notify.error err "Action: eval-current-file"))))

(fn action-commands.source-current-file []
  (let [(ok? err) (pcall cmd "source %")]
    (if ok?
      (notify.info "Current file sourced" "Action: source-current-file")
      (notify.error err "Action: source-current-file"))))

(fn action-commands.eval []
  (todo :action-commands.eval))

action-commands
