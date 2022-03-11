;; Module for configure todo-comments
(local tsv (require :utils))

(let [(ok? todo-comments) (tsv.require-plugin :todo-comments)]
   (if ok? 
     (todo-comments.setup)
     :otherwise (tsv.notify todo-comments
                            [:module :modules.todo-comments.config])))
