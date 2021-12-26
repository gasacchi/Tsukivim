;; Module for configure kommentary
(local {: require-plugin} (require :lib.tsukivim))

(let [(ok? kommentary) (require-plugin :kommentary.config)]
 (when ok?
   (kommentary.configure_language) 
   :fennel {:single_line_comment_string ";;" 
            :prefer_single_line_comments true}))

