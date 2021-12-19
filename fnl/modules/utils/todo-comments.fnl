;; Module for configure todo-comments
(local {: plugin-exist?} (require :lib.tsukivim))

(fn config []
  "Function that run after todo-comments is loaded"
  (when (plugin-exist? :todo-comments.nvim)
     (let [todo-comments (require :todo-comments)]
        (todo-comments.setup))))

{: config}
