;; Module for configure colorizer

(local {: plugin-exist?} (require :lib.tsukivim))

(fn config []
  "Function that run after colorizer.lua is loaded"
  (when (plugin-exist? :nvim-colorizer.lua)
     (let [colorizer (require :colorizer)]
      (colorizer.setup))))

{: config}
