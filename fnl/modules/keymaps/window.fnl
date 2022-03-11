;; Module contains windows keymaps

(local window-cmd (require :modules.commands.window))

{:normal 
 {:name :Windows
  " " [:<Esc>                               :Close]
  :H  [window-cmd.decrease-vertical-size    :Decrease-vertical-size]
  :L  [window-cmd.increase-vertical-size    :Incease-vertical-size]
  :J  [window-cmd.decrease-horizontal-size  :Decrease-horizontal-size]
  :K  [window-cmd.increase-horizontal-size  :Increase-horizontal-size]
  :=  [window-cmd.equal-size                :Equal-window-size]
  :h  [window-cmd.goto-left                 :Goto-left-window]
  :l  [window-cmd.goto-right                :Goto-right-window]
  :j  [window-cmd.goto-below                :Goto-bottom-window]
  :k  [window-cmd.goto-above                :Goto-top-window]
  :n  [window-cmd.goto-next                 :Goto-next-window]
  :p  [window-cmd.goto-prev                 :Goto-prev-window]
  :s  [window-cmd.horizontal-split          :Split-window-horizontaly]
  :v  [window-cmd.vertical-split            :Split-window-verticaly]
  ;; :S  [(cmd :new true)                      :New-horizontal-window]
  ;; :V  [(cmd :vnew true)                     :New-vertical-window]
  :d  [window-cmd.delete-current            :Delete-current-window]
  :D  [window-cmd.delete-other              :Delete-other-window]
  :r  [window-cmd.rotate-rightwards         :Rotate-rightwards]
  :R  [window-cmd.rotate-leftwards          :Rotate-leftwards]
  :x  [window-cmd.exchange                  :Exchange-window]}}

