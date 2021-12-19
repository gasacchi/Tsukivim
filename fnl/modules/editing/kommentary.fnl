;; Module for configure kommentary
(local {: plugin-exist?} (require :lib.tsukivim))

(fn config []
  "Function that run after kommentary is loaded"
  (when (plugin-exist? :kommentary)
     (let [kommentary (require :kommentary.config)]
      (kommentary.configure_language 
        :fennel {:single_line_comment_string ";;" 
                 :prefer_single_line_comments true}))))

{: config}
