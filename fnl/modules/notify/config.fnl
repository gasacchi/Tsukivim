;; Module for configure notify
(local tsv (require :utils))
(local colors (require :modules.themes.colors))

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

(let [(ok? notify) (tsv.require-plugin :notify)]
  (if ok?
    (do 
      (notify.setup 
        {:stages :fade
         :background_colour "#16161D"
         :minimal_width 60})
      (each [group {: fg} (pairs notify-colors)]
        (tsv.cmd (.. "hi " group " guifg=" fg))))
    :otherwise (tsv.notify notify
                           [:module :modules.notify.config])))
