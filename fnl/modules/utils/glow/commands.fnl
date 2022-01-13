;; Module contains glow markdown commands

(local tsv (require :lib.tsukivim))

(fn toggle []
  "Toggle markdown previewer"
  (let [(ok? err) (pcall tsv.cmd "Glow %")]
    (when (not ok?)
      (tsv.notify.error err
                        [:fn:toggle :modules.utils.glow.commands]))))

{: toggle}
