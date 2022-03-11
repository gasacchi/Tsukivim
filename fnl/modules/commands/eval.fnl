;; Module contains tsukivim / hotpot core commands

(local tsv (require :utils))

(fn file [file]
  "Evaluate given fennel file"
  (tsv.cmd (.. "Fnlfile " file))
  (tsv.notify.info (.. file " evaluated" 
                    [:fn:file :modules.commands.eval])))

(fn current-file []
  "Evaluate current fennel file."
  (let [(ok? err) (pcall tsv.cmd "Fnlfile %")]
    (if ok?
      (tsv.notify.info "Current file evaluated" 
                       [:fn:current-file :modules.commands.eval])
      :otherwise (tsv.notify.error err 
                                   [:fn:current-file 
                                    :modules.commands.eval]))))

(fn source []
  (let [(ok? err) (pcall tsv.cmd "source %")]
    (if ok?
      (tsv.notify.info "Current file sourced" 
                       [:fn:source :modules.core.commands.eval])
      :otherwise (tsv.notify.error err 
                                   [:fn:source :modules.commands.eval]))))

(fn eval []
  (tsv.todo :action-commands.eval))

{: file
 : current-file
 : source
 : eval}

