;; Module for configure notify
(local {: require-plugin : cmd} (require :lib.tsukivim))
(local colors (require :modules.ui.colors))

(local notify-colors
  {:NotifyERRORBorder {:fg colors.peachRed}
   :NotifyWARNBorder {:fg colors.surimiOrange}
   :NotifyINFOBorder {:fg colors.crystalBlue}
   :NotifyDEBUGBorder {:fg colors.springGreen}
   :NotifyTRACEBorder {:fg colors.samuraiRed}
   :NotifyERRORIcon {:fg colors.peachRed}
   :NotifyWARNIcon {:fg colors.surimiOrange}
   :NotifyINFOIcon {:fg colors.crystalBlue}
   :NotifyDEBUGIcon {:fg colors.springGreen}
   :NotifyTRACEIcon {:fg colors.samuraiRed}
   :NotifyERRORTitle {:fg colors.peachRed}
   :NotifyWARNTitle {:fg colors.surimiOrange}
   :NotifyINFOTitle {:fg colors.crystalBlue}
   :NotifyDEBUGTitle {:fg colors.springGreen}
   :NotifyTRACETitle {:fg colors.samuraiRed}})

(let [(ok? notify) (require-plugin :notify)]
  (when ok?
    (notify.setup 
      {:stages :fade
       :background_colour "#16161D"})
    (each [group {: fg} (pairs notify-colors)]
      (cmd (.. "hi " group " guifg=" fg)))))


