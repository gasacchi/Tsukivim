;; Module contains toggleterm.nvim commands

(local tsv (require :lib.tsukivim))

(fn toggle []
  "Toggle terminal"
  (tsv.cmd "ToggleTerm dir=git_dir"))

(fn toggle-all []
  "Toggle all currently opened terminal"
  (tsv.cmd :ToggleTermToggleAll))

{: toggle
 : toggle-all}
