;; Module contains window commands

(local tsv (require :lib.tsukivim))

(fn decrease-vertical-size []
  "Decrease vertical size by 5"
  (tsv.cmd "vertical resize -5"))

(fn increase-vertical-size []
  "Increase vertical size by 5"
  (tsv.cmd "vertical resize +5"))

(fn decrease-horizontal-size []
  "Decrease horizontal sive by 5"
  (tsv.cmd "resize -5"))

(fn increase-horizontal-size []
  "Increase horizontal sive by 5"
  (tsv.cmd "resize -5"))

(fn equal-size []
  "Equaly resize window"
  (tsv.cmd "wincmd ="))

(fn goto-left []
  "Go to left window"
  (tsv.cmd "wincmd h"))

(fn goto-right []
  "Go to right window"
  (tsv.cmd "wincmd l"))

(fn goto-above []
  "Go to window above"
  (tsv.cmd "wincmd k"))

(fn goto-below []
  "Go to window below"
  (tsv.cmd "wincmd j"))

(fn goto-next []
  "Go to next window"
  (tsv.cmd "wincmd w"))

(fn goto-prev []
  "Go to previous window"
  (tsv.cmd "wincmd p"))

(fn horizontal-split []
  "Split window horizontaly"
  (tsv.cmd :split))

(fn vertical-split []
  "Split window verticaly"
  (tsv.cmd :vsplit))

(fn delete-current []
  "Delete / close current window"
  (tsv.cmd :close))

(fn delete-other []
  "Delete / close other window"
  (tsv.cmd :only))

(fn rotate-rightwards []
  "Rotate window downwards or rightwards"
  (tsv.cmd "wincmd r"))

(fn rotate-leftwards []
  "Rotate window upwards or leftwards"
  (tsv.cmd "wincmd R"))

(fn exchange []
  "Exchange window with next window, if there is no next window,
  exchange with previous window"
  (tsv.cmd "wincmd x"))

{: decrease-vertical-size
 : decrease-horizontal-size
 : increase-vertical-size
 : increase-horizontal-size
 : equal-size
 : goto-left
 : goto-right
 : goto-above
 : goto-below
 : goto-next
 : goto-prev
 : horizontal-split
 : vertical-split
 : delete-current
 : delete-other
 : rotate-rightward
 : rotate-leftward
 : exchange}
 
