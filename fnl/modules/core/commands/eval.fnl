;; Module contains tsukivim / hotpot core commands

(local tsv (require :lib.tsukivim))

(fn file [file]
  "Evaluate given fennel file"
  (tsv.cmd (.. "Fnlfile " file))
  (tsv.notify.info (.. file " evaluated") "Action: eval-file"))

(fn current-file []
  "Evaluate current fennel file."
  (let [(ok? err) (pcall tsv.cmd "Fnlfile %")]
    (if ok?
      (tsv.notify.info "Current file evaluated" "Action: eval-current-file")
      :otherwise (tsv.notify.error err "Action: eval-current-file"))))

(fn source []
  (let [(ok? err) (pcall tsv.cmd "source %")]
    (if ok?
      (tsv.notify.info "Current file sourced" "Action: source-current-file")
      :otherwise (tsv.notify.error err "Action: source-current-file"))))

(fn eval []
  (todo :action-commands.eval))

{: file
 : current-file
 : source
 : eval}
