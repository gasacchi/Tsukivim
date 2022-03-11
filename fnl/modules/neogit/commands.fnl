;; Module contain neogit commands

(local tsv (require :utils))

(fn open []
  "Open neogit in split below mode"
  (tsv.cmd "Neogit kind=split"))

(fn commit []
  "Open neogit commit"
  (tsv.cmd "Neogit commit"))

{: open
 : commit}

