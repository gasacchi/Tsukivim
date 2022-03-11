;; Module contains todo-comments commands

(local tsv (require :utils))

(fn trouble-toggle []
  "Open todo list in trouble.nvim"
  (tsv.cmd :TodoTrouble))

{: trouble-toggle}

