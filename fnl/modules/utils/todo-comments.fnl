;; Module for configure todo-comments
(local {: require-plugin} (require :lib.tsukivim))

(let [(ok? todo-comments) (require-plugin :todo-comments)]
   (when ok? 
     (todo-comments.setup)))

