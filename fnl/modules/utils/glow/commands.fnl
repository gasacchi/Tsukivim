;; Module contains glow markdown commands

(local tsv (require :lib.tsukivim))

(fn toggle []
  "Toggle markdown previewer"
  (tsv.cmd "Glow %"))

{: toggle}
