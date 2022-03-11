;; Module contains glow markdown commands

(local tsv (require :utils))

(fn toggle []
  "Toggle markdown previewer"
  (tsv.cmd "Glow %"))

{: toggle}

