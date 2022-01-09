;; Module contains bufferline.nvim commands for whichkey
(local bufferline-cmd (require :modules.ui.bufferline.commands))
 
{:name :Buffers
       " " [:<Esc>                                  :Close]
       :b  [bufferline-cmd.pick-buffer                  :Pick-goto-buffer]
       :d  [bufferline-cmd.delete-buffer                :Delete-current-buffer]
       :D  [bufferline-cmd.pick-and-close-buffer        :Pick-delete-buffer]
       :f  [bufferline-cmd.first-buffer                 :Goto-first-buffer]
       :l  [bufferline-cmd.last-buffer                  :Goto-last-buffer]
       :n  [bufferline-cmd.cycle-next                   :Goto-next-buffer]
       :p  [bufferline-cmd.cycle-prev                   :Goto-prev-buffer]
       ;; :s  [search-cmd.buffers                      :Search-buffer]
       :1  [(bufferline-cmd.goto-buffer 1)              :Goto-buffer-1]
       :2  [(bufferline-cmd.goto-buffer 2)              :Goto-buffer-2]
       :3  [(bufferline-cmd.goto-buffer 3)              :Goto-buffer-3]
       :4  [(bufferline-cmd.goto-buffer 4)              :Goto-buffer-4]
       :5  [(bufferline-cmd.goto-buffer 5)              :Goto-buffer-5]
       :6  [(bufferline-cmd.goto-buffer 6)              :Goto-buffer-6]
       :7  [(bufferline-cmd.goto-buffer 7)              :Goto-buffer-7]
       :8  [(bufferline-cmd.goto-buffer 8)              :Goto-buffer-8]
       :9  [(bufferline-cmd.goto-buffer 9)              :Goto-buffer-9]}

