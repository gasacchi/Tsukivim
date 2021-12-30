;; Module for configure themes
(local 
  {: require-plugin : cmd } (require :lib.tsukivim))

(local colors (require :modules.ui.colors))

(local overrides 
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
   
(let [(ok? kanagawa) (require-plugin :kanagawa)
      {: gui?} (require :modules.ui.gui)]
  (when ok?
    (kanagawa.setup 
      {: overrides
       : colors
       :transparent (not (gui?))}
      (cmd "colorscheme kanagawa"))))



