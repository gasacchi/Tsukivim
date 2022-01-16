;; Module contains todo-comments commands

(local tsv (require :lib.tsukivim))

(fn trouble-toggle []
  "Open todo list in trouble.nvim"
  (tsv.cmd :TodoTrouble))

{: trouble-toggle}
