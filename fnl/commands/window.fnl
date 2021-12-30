;; Module contains window commands
(local {: cmd} (require :lib.tsukivim))

(local window-commands {})

(fn window-commands.decrease-vertical-size []
  "Decrease vertical size by 5"
  (cmd "vertical resize -5"))

(fn window-commands.increase-vertical-size []
  "Increase vertical size by 5"
  (cmd "vertical resize +5"))

(fn window-commands.decrease-horizontal-size []
  "Decrease horizontal sive by 5"
  (cmd "resize -5"))

(fn window-commands.increase-horizontal-size []
  "Increase horizontal sive by 5"
  (cmd "resize -5"))

(fn window-commands.equal-window-size []
  "Equaly resize window"
  (cmd "wincmd ="))

(fn window-commands.goto-left []
  "Go to left window"
  (cmd "wincmd h"))

(fn window-commands.goto-right []
  "Go to right window"
  (cmd "wincmd l"))

(fn window-commands.goto-above []
  "Go to window above"
  (cmd "wincmd k"))

(fn window-commands.goto-below []
  "Go to window below"
  (cmd "wincmd j"))

(fn window-commands.goto-next []
  "Go to next window"
  (cmd "wincmd w"))

(fn window-commands.goto-prev []
  "Go to previous window"
  (cmd "wincmd p"))

(fn window-commands.horizontal-split []
  "Split window horizontaly"
  (cmd :split))

(fn window-commands.vertical-split []
  "Split window verticaly"
  (cmd :vsplit))

(fn window-commands.delete-current-window []
  "Delete / close current window"
  (cmd :close))

(fn window-commands.delete-other-window []
  "Delete / close other window"
  (cmd :only))

(fn window-commands.rotate-window-rightwards []
  "Rotate window downwards or rightwards"
  (cmd "wincmd r"))

(fn window-commands.rotate-window-leftwards []
  "Rotate window upwards or leftwards"
  (cmd "wincmd R"))

(fn window-commands.exchange []
  "Exchange window with next window, if there is no next window,
  exchange with previous window"
  (cmd "wincmd x"))
  
window-commands

