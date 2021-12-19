;; Module for configure statusline
(local {: plugin-exist?} (require :lib.tsukivim))

(fn config []
  "Function that run after lualine.nvim loaded"
  (when (plugin-exist? :lualine.nvim)
   (let [lualine (require :lualine)]
    (lualine.setup 
      {:options 
       {:theme :tokyonight}}))))

{: config}
