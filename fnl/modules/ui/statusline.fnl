;; Module for configure statusline
(local {: require-plugin} (require :lib.tsukivim))

(let [(ok? lualine) (require-plugin :lualine)]
  (when ok?
   (lualine.setup 
     {:options 
      {:theme :tokyonight}})))

