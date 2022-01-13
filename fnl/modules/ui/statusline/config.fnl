;; Module for configure statusline

(local tsv (require :lib.tsukivim))

(fn mode []
  "Redraw Lualine foreground color when mode is changed"
  (let [color (require :modules.ui.themes.colors)
        color-mode {:n    [color.springGreen  :normal]
                    :no   [color.autumnGreen  :o-pending]
                    :nov  [color.autumnGreen  :o-pending]
                    :nov  [color.autumnGreen  :o-pending]
                    :no^V [color.autumnGreen  :o-pending]
                    :niI  [color.springGreen  :normal]
                    :niR  [color.springGreen  :normal]
                    :niV  [color.springGreen  :normal]
                    :nt   [color.springGreen  :normal]
                    :v    [color.surimiOrange :visual]
                    :vs   [color.surimiOrange :visual]
                    :V    [color.carpYellow   :visual-line]
                    :Vs   [color.carpYellow   :visual-line]
                    :^V   [color.boatYellow2  :visual-block]
                    :^Vs  [color.boatYellow2  :visual-block]
                    :s    [color.crystalBlue  :select]
                    :S    [color.springBlue   :select-line]
                    :^S   [color.waveAqua2    :select-block]
                    :i    [color.fujiWhite    :insert]
                    :ic   [color.fujiWhite    :insert]
                    :ix   [color.fujiWhite    :insert]
                    :R    [color.autumnRed    :replace]
                    :Rc   [color.autumnRed    :replace]
                    :Rx   [color.autumnRed    :replace]
                    :Rv   [color.waveRed      :visual-replace]
                    :Rvc  [color.waveRed      :visual-replace]
                    :Rvx  [color.waveRed      :visual-replace]
                    :c    [color.peachRed     :command]
                    :cv   [color.samuraiRed   :ex]
                    :ce   [color.samuraiRed   :ex]
                    :r    [color.autumnRed    :replace]
                    :rm   [color.sakuraPink   :more]
                    :r?   [color.surimiOrange :confirm]
                    :!    [color.samuraiRed   :shell]
                    :t    [color.roninYellow  :terminal]}
        mode-name (. color-mode (vim.fn.mode) 2)
        fg-color (. color-mode (vim.fn.mode) 1)] ;; Terminal
      (tsv.cmd (.. "hi! LualineMode guifg=" fg-color " guibg=" color.sumiInk0))
      (.. " " mode-name)))

(fn position []
  (let [(row col) (unpack (vim.api.nvim_win_get_cursor 0))]
    (.. "line:" row " col:" col)))

(local filename
  {1 :filename
   :color {:bg :#252535}
   :separator {:left "" :right "  "}
   :symbols {:modified " ᵐᵒᵈⁱᶠⁱᵉᵈ"
             :readonly "  "
             :unnamed " -no name-"}}) 

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
   :lualine_c [filename]
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

(local inactive-section 
  {:lualine_c [filename]
   :lualine_x [position]})

(let [(ok? lualine) (tsv.require-plugin :lualine)]
  (if ok?
   (lualine.setup {:options {:theme :kanagawa}
                   : sections
                   :inactive_sections inactive-section})
   :otherwise (tsv.notify.error lualine
                                [:module :modules.ui.statusline.config])))

