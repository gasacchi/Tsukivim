;; Module for configure statusline
(local {: cmd : require-plugin} (require :lib.tsukivim))

(fn mode []
  (let [(ok? kanagaw-color) (require-plugin :kanagawa.colors)
        color (kanagaw-color.setup)
        color-mode {:n    [color.springGreen  :normal];; Normal
                    :no   [color.autumnGreen  :o-pending];; O-pending
                    :nov  [color.autumnGreen  :o-pending];; O-pending
                    :nov  [color.autumnGreen  :o-pending];; O-pending
                    :no^V [color.autumnGreen  :o-pending];; O-pending
                    :niI  [color.springGreen  :normal];; Normal
                    :niR  [color.springGreen  :normal];; Normal
                    :niV  [color.springGreen  :normal];; Normal
                    :nt   [color.springGreen  :normal];; Normal
                    :v    [color.surimiOrange :visual];; Visual
                    :vs   [color.surimiOrange :visual];; Visual
                    :V    [color.carpYellow   :visual-line] ;; V-line
                    :Vs   [color.carpYellow   :visual-line];; V-line
                    :^V   [color.boatYellow2  :visual-block];; V-block
                    :^Vs  [color.boatYellow2  :visual-block];; V-block
                    :s    [color.crystalBlue  :select];; Select
                    :S    [color.springBlue   :select-line];; S-line
                    :^S   [color.waveAqua2    :select-block] ;; S-block
                    :i    [color.fujiWhite    :insert];; Insert
                    :ic   [color.fujiWhite    :insert] ;; Insert
                    :ix   [color.fujiWhite    :insert];; Insert
                    :R    [color.autumnRed    :replace];; Replace
                    :Rc   [color.autumnRed    :replace];; Replace
                    :Rx   [color.autumnRed    :replace];; Replace
                    :Rv   [color.waveRed      :visual-replace];; V-Replace
                    :Rvc  [color.waveRed      :visual-replace];; V-Replace
                    :Rvx  [color.waveRed      :visual-replace];; V-Replace
                    :c    [color.peachRed     :command] ;; Command
                    :cv   [color.samuraiRed   :ex];; EX
                    :ce   [color.samuraiRed   :ex] ;; EX
                    :r    [color.autumnRed    :replace] ;; Replace
                    :rm   [color.sakuraPink   :more];; MORE
                    :r?   [color.surimiOrange :confirm] ;; Confirm
                    :!    [color.samuraiRed   :shell] ;; Shell
                    :t    [color.roninYellow  :terminal]}
        mode-name (. color-mode (vim.fn.mode) 2)
        fg-color (. color-mode (vim.fn.mode) 1)] ;; Terminal
    (when ok?
      (cmd (.. "hi! LualineMode guifg=" fg-color " guibg=" color.sumiInk0))
      (.. " " mode-name))))
                    
(fn position []
  (let [(row col) (unpack (vim.api.nvim_win_get_cursor 0))]
    (.. "line:" row " col:" col)))
  

(local sections 
  {:lualine_a [{1 mode
                :color :LualineMode
                :separator {:left "" :right " "}}]
   :lualine_b [{1 :branch
                :separator {:left "" :right " "}
                :color {:fg :#FF9E3B 
                        :bg :#363646
                        :gui :bold}}
               {1 :diff 
                :color {:bg :#363646}
                :separator {:left "" :right " "}} 
               {1 :diagnostics
                :separator {:left "" :right "  "}}]
   :lualine_c [{1 :filename
                :color {:bg :#252535}
                :separator {:left "" :right "  "}
                :symbols {:modified "  "
                          :readonly "  "
                          :unnamed " -no name-"}}]
   :lualine_x [{1 :filetype
                :color {:bg :#252535}
                :separator {:left " " :right ""}}]
   :lualine_y [{1 :progress
                :color {:bg :#363646 
                        :fg :#DCA561}
                :separator {:left " " :right ""}}]
   :lualine_z [{1 position
                :color :LualineMode
                :separator {:left " " :right ""}}]})

(let [(ok? lualine) (require-plugin :lualine)]
  (when ok?
   (lualine.setup {:options {:theme :kanagawa}
                   : sections})))


