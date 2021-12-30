;; Module contains buffer commands
(local {: cmd} (require :lib.tsukivim))

;; Buffer related commands
(local buffer-commands {})

(fn buffer-commands.cycle-next []
  "Cycle through next buffer"
  (cmd :BufferLineCycleNext))

(fn buffer-commands.cycle-prev []
  "Cycle through previous buffer"
  (cmd :BufferLineCyclePrev))

(fn buffer-commands.pick-buffer []
  "Pick and go to buffer"
  (cmd :BufferLinePick))

(fn buffer-commands.pick-and-close-buffer []
  "Pick and close buffer"
  (cmd :BufferLinePickClose))

(fn buffer-commands.goto-buffer [number]
  "Go to buffer with given buffer number"
  (let [buffer-number-cmd (.. "BufferLineGoToBuffer " number)]
   (lambda [] 
     (cmd buffer-number-cmd))))

(fn buffer-commands.delete-buffer []
  "Delete buffer without destroying window layout"
  (cmd :Bdelete))

(fn buffer-commands.first-buffer []
  "Go to first buffer"
  (cmd :bfirst))

(fn buffer-commands.last-buffer []
  "Go to last buffer"
  (cmd :blast))

buffer-commands

