;; Module contains nvim-colorizer.lua commands
(local tsv (require :lib.tsukivim))

(fn toggle []
  "Toggle color highlight colorizer"
  (tsv.cmd :ColorizerToggle))

{: toggle}
