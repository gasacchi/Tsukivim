;; Module contains buffer commands

(local tsv (require :lib.tsukivim))

(fn cycle-next []
  "Cycle through next buffer"
  (tsv.cmd :BufferLineCycleNext))

(fn cycle-prev []
  "Cycle through previous buffer"
  (tsv.cmd :BufferLineCyclePrev))

(fn pick-buffer []
  "Pick and go to buffer"
  (tsv.cmd :BufferLinePick))

(fn pick-and-close-buffer []
  "Pick and close buffer"
  (tsv.cmd :BufferLinePickClose))

(fn goto-buffer [number]
  "Go to buffer with given buffer number"
  (let [buffer-number-cmd (.. "BufferLineGoToBuffer " number)]
   (lambda [] 
     (tsv.cmd buffer-number-cmd))))

(fn delete-buffer []
  "Delete buffer without destroying window layout"
  (let [(deleted? err) (pcall tsv.cmd :Bdelete)]
    (if (not deleted?)
      (tsv.notify.error err "Buffer: delete")
      (tsv.notify.info "Buffer deleted." "Buffer: delete"))))

(fn first-buffer []
  "Go to first buffer"
  (tsv.cmd :bfirst))

(fn last-buffer []
  "Go to last buffer"
  (tsv.cmd :blast))

{: cycle-next
 : cycle-prev
 : pick-buffer
 : pick-and-close-buffer
 : goto-buffer
 : delete-buffer
 : first-buffer
 : last-buffer}

