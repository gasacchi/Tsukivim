;; Module for hop keymaps

(local vim (require :lib.vim))
(local hop-cmd (require :modules.editing.hop.commands))

(fn target->hop-keymaps [target]
  (let [(name _) (string.gsub target "^%l" string.upper)
        general-keys {: name
                      :j [(. hop-cmd target :after-cursor) 
                          (.. :Hop- target :-after-cursor)]
                      :k [(. hop-cmd target :before-cursor) 
                          (.. :Hop- target :-before-cursor)]
                      :l [(. hop-cmd target :after-cursor-current-line) 
                          (.. :Hop- target :-after-cursor-current-line)]
                      :h [(. hop-cmd target :before-cursor-current-line) 
                          (.. :Hop- target :-before-cursor-current-line)]}]
    (match target
      :word (vim.extend :keep {:w [(. hop-cmd target :all) 
                                   (.. :Hop- target :-all)]
                               :W [(. hop-cmd target :current-line)
                                   (.. :Hop- target :-current-line)]} general-keys) 
      :pattern (vim.extend :keep {:p [(. hop-cmd target :all) 
                                      (.. :Hop- target :-all)]
                                  :P [(. hop-cmd target :current-line)
                                      (.. :Hop- target :-current-line)]} general-keys) 
      :one-char (vim.extend :keep {:c [(. hop-cmd target :all) 
                                       (.. :Hop- target :-all)]
                                   :C [(. hop-cmd target :current-line)
                                       (.. :Hop- target :-current-line)]} general-keys) 
      :two-char (vim.extend :keep {:c [(. hop-cmd target :all) 
                                       (.. :Hop- target :-all)]
                                   :C [(. hop-cmd target :current-line)
                                       (.. :Hop- target :-current-line)]} general-keys) 
      :line {: name
             :j general-keys.j
             :k general-keys.k
             :l [(. hop-cmd target :all) (.. :Hop- target :-all)]} 
      :line-start {: name
                   :j general-keys.j
                   :k general-keys.k
                   :l [(. hop-cmd target :all) (.. :Hop- target :-all)]}))) 

{:w (target->hop-keymaps :word)
 :p (target->hop-keymaps :pattern)
 :c (target->hop-keymaps :one-char)
 :C (target->hop-keymaps :two-char)
 :l (target->hop-keymaps :line)
 :L (target->hop-keymaps :line-start)}
