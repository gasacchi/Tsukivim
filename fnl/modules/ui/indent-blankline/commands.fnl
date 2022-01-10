;; Module contains indent-blankline.nvim commands
(local tsv (require :lib.tsukivim))

(fn enable []
  "Enable indent-blankline"
  (tsv.cmd :IndentBlanklineEnable))

(fn disable []
  "Disable indent-blankline"
  (tsv.cmd :IndentBlanklineDisable))

(fn toggle []
  "Toggle between Enable and Disable indent-blankline"
  (tsv.cmd :IndentBlanklineToggle))

{: enable
 : disable
 : toggle}
