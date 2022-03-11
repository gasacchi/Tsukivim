;; Module contains zen-mode.nvim and twilight.nvim commands

(local tsv (require :utils))

(fn twilight-toggle []
  "Toggle twilight mode"
  (tsv.cmd :Twilight))

(fn toggle []
  "Toggle zen-mode enable / disable"
  (tsv.cmd :ZenMode))

{: twilight-toggle
 : toggle}

