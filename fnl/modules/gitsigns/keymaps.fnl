;; Module contains gitsigns keymaps

(local gitsigns-cmd (require :modules.gitsigns.commands))

{:normal {:n [gitsigns-cmd.next                    :Next-hunk]
          :p [gitsigns-cmd.prev                    :Prev-hunk]
          :s [gitsigns-cmd.stage                   :Stage-hunk]
          :S [gitsigns-cmd.stage-buffer            :Stage-buffer]
          :u [gitsigns-cmd.undo-stage              :Undo-stage]
          :r [gitsigns-cmd.reset                   :Reset-hunk]
          :P [gitsigns-cmd.preview                 :Preview-hunk]
          :b [gitsigns-cmd.blame                   :Preview-hunk]}
 :visual {:s [gitsigns-cmd.stage                   :Stage-hunk]
          :r [gitsigns-cmd.reset                   :Reset-hunk]}}

