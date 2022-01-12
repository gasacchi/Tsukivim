;; Module contains tsukivim / hotpot core commands

(local tsv (require :lib.tsukivim))

(fn file [file]
  "Evaluate given fennel file"
  (tsv.cmd (.. "Fnlfile " file))
  (tsv.notify.info (.. file " evaluated") 
                   "modules.core.commands.eval: fn file"))

(fn current-file []
  "Evaluate current fennel file."
  (let [(ok? err) (pcall tsv.cmd "Fnlfile %")]
    (if ok?
      (tsv.notify.info "Current file evaluated" 
                       "modules.core.commands.eval: fn file")
      :otherwise (tsv.notify.error err 
                                   "modules.core.commands.eval: fn file"))))

(fn source []
  (let [(ok? err) (pcall tsv.cmd "source %")]
    (if ok?
      (tsv.notify.info "Current file sourced" 
                       "modules.core.commands.eval: fn source")
      :otherwise (tsv.notify.error err 
                                   "modules.core.commands.eval: fn source"))))

(fn eval []
  (tsv.todo :action-commands.eval))

{: file
 : current-file
 : source
 : eval}
