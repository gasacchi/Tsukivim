;; Module for configure todo-comments
(local tsv (require :lib.tsukivim))

(let [(ok? todo-comments) (tsv.require-plugin :todo-comments)]
   (if ok? 
     (todo-comments.setup)
     :otherwise (tsv.notify "Cannot load todo-comments.nvim"
                            "Plugin: todo-comments.nvim")))

