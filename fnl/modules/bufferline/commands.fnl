;; Module contains buffer commands

(local tsv (require :utils))

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

;; FIX: handle error when buffer not saved
(fn delete []
  "Delete buffer without destroying window layout"
  (let [(deleted? err) (pcall tsv.cmd :Bdelete)]
    (if (not deleted?)
      (tsv.notify.error err 
                        [:fn:delete-buffer :modules.bufferline.commands])
      :otherwise (tsv.notify.info "Buffer deleted." 
                       [:fn:delete-buffer :modules.bufferline.commands]))))

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

