;; Module contains buffer commands

(local tsv (require :lib.tsukivim))

(fn next []
  "Cycle through next buffer"
  (tsv.cmd :BufferLineCycleNext))

(fn prev []
  "Cycle through previous buffer"
  (tsv.cmd :BufferLineCyclePrev))

(fn pick []
  "Pick and go to buffer"
  (tsv.cmd :BufferLinePick))

(fn pick-and-close []
  "Pick and close buffer"
  (tsv.cmd :BufferLinePickClose))

(fn goto [number]
  "Go to buffer with given buffer number"
  (let [buffer-number-cmd (.. "BufferLineGoToBuffer " number)]
   (lambda [] 
     (tsv.cmd buffer-number-cmd))))

(fn delete []
  "Delete buffer without destroying window layout"
  (let [(deleted? err) (pcall tsv.cmd :Bdelete)]
    (if (not deleted?)
      (tsv.notify.error err "modules.ui.bufferline.commands: fn delete-buffer")
      :otherwise (tsv.notify.info "Buffer deleted." 
                       "modules.ui.bufferline.commands: fn delete-buffer"))))

(fn first []
  "Go to first buffer"
  (tsv.cmd :bfirst))

(fn last []
  "Go to last buffer"
  (tsv.cmd :blast))

{: next
 : prev
 : pick
 : pick-and-close
 : goto
 : delete
 : first
 : last}

