;; Module contains nvim-colorizer.lua commands
(local tsv (require :utils))

(fn toggle []
  "Toggle color highlight colorizer"
  (tsv.cmd :ColorizerToggle))

{: toggle}

