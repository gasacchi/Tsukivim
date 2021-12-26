(local {: require-plugin} (require :lib.tsukivim))
;; Module for configure marks
(fn config []
  "Run after marks.nvim is loaded"
  (let [(ok? marks) (require-plugin :marks)]
    (when ok?
      (marks.setup) 
      {:default_mappings false})))

{: config}
