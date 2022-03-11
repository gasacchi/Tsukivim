;; Module contains bufferline.nvim commands for whichkey
(local bufferline-cmd (require :modules.bufferline.commands))
(local telescope-cmd (require :modules.telescope.commands))
 
{:normal 
 {:name :Buffers
   " " [:<Esc>                               :Close]
   :b  [bufferline-cmd.pick                  :Pick-goto-buffer]
   :d  [bufferline-cmd.delete                :Delete-current-buffer]
   :D  [bufferline-cmd.pick-and-close        :Pick-delete-buffer]
   :f  [bufferline-cmd.first                 :Goto-first-buffer]
   :l  [bufferline-cmd.last                  :Goto-last-buffer]
   :n  [bufferline-cmd.next                  :Goto-next-buffer]
   :p  [bufferline-cmd.prev                  :Goto-prev-buffer]
   :s  [telescope-cmd.buffers                :Search-buffer]
   :1  [(bufferline-cmd.goto 1)              :Goto-buffer-1]
   :2  [(bufferline-cmd.goto 2)              :Goto-buffer-2]
   :3  [(bufferline-cmd.goto 3)              :Goto-buffer-3]
   :4  [(bufferline-cmd.goto 4)              :Goto-buffer-4]
   :5  [(bufferline-cmd.goto 5)              :Goto-buffer-5]
   :6  [(bufferline-cmd.goto 6)              :Goto-buffer-6]
   :7  [(bufferline-cmd.goto 7)              :Goto-buffer-7]
   :8  [(bufferline-cmd.goto 8)              :Goto-buffer-8]
   :9  [(bufferline-cmd.goto 9)              :Goto-buffer-9]}}

