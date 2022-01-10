;; Module contains Alpha dashboard commands

(fn open []
  "Open alpha dashboard"
  (tsv.cmd :Alpha))

(fn redraw []
  "Redraw alpha dashboard"
  (tsv.cmd :AlphaRedraw))

{: open
 : redraw}
