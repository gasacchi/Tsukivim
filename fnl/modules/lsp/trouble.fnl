;; Module for configure Trouble.nvim
(local {: plugin-exist?} (require :lib.tsukivim))

(fn config []
  "Function that run after trouble.nvim is loaded"
  (when (plugin-exist? :trouble.nvim)
     (let [trouble (require :trouble)] 
      (trouble.setup))))

{: config}
