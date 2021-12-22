(local {: plugin-exist?} (require :lib.tsukivim))
;; Module for configure marks
(fn config []
  "Function that run after marks.nvim is loaded"
  (when (plugin-exist? :marks.nvim)
    (let [marks (require :marks)]
      (marks.setup 
        {:default_mappings false
         }))))

{: config}
