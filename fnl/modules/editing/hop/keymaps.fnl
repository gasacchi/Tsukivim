;; Module for hop keymaps

(local vim (require :lib.vim))
(local hop-cmd (require :modules.editing.hop.commands))

(fn target->hop-keymaps [target]
  (let [(name _) (string.gsub target "^%l" string.upper)
        general-keys {: name
                      :j [(. hop-cmd target :after-cursor) 
                          (.. :Hop- target :-after-cursor)]
                      :k [(. hop-cmd target :before-cursor) 
                          (.. :Hop- target :-before-cursor)]}]
                      ; :l [(. hop-cmd target :after-cursor-current-line) 
                      ;     (.. :Hop- target :-after-cursor-current-line)]
                      ; :h [(. hop-cmd target :before-cursor-current-line) 
                      ;     (.. :Hop- target :-before-cursor-current-line)]}]
    (match target
      :words (vim.extend :keep {:w [(. hop-cmd target :all) 
                                    (.. :Hop- target :-all)]} general-keys)
                                ; :W [(. hop-cmd target :current-line)
                                ;     (.. :Hop- target :-current-line)]} general-keys) 
      :patterns (vim.extend :keep {:p [(. hop-cmd target :all) 
                                       (.. :Hop- target :-all)]} general-keys)
                                   ; :P [(. hop-cmd target :current-line)
                                   ;     (.. :Hop- target :-current-line)]} general-keys) 
      :one-char (vim.extend :keep {:c [(. hop-cmd target :all) 
                                       (.. :Hop- target :-all)]} general-keys)
                                   ; :C [(. hop-cmd target :current-line)
                                   ;     (.. :Hop- target :-current-line)]} general-keys) 
      :two-char (vim.extend :keep {:c [(. hop-cmd target :all) 
                                       (.. :Hop- target :-all)]} general-keys)
                                   ; :C [(. hop-cmd target :current-line)
                                   ;     (.. :Hop- target :-current-line)]} general-keys) 
      :s-exp (vim.extend :keep {:s [(. hop-cmd target :all) 
                                    (.. :Hop- target :-all)]} general-keys)
                                ; :S [(. hop-cmd target :current-line)
                                ;     (.. :Hop- target :-current-line)]} general-keys) 
      :lines {: name
              :j general-keys.j
              :k general-keys.k
              :l [(. hop-cmd target :all) (.. :Hop- target :-all)]} 
      :line-starts {: name
                    :j general-keys.j
                    :k general-keys.k
                    :l [(. hop-cmd target :all) (.. :Hop- target :-all)]})))


{:C (target->hop-keymaps :two-char)
 :L (target->hop-keymaps :line-starts)
 :c (target->hop-keymaps :one-char)
 :l (target->hop-keymaps :lines)
 :p (target->hop-keymaps :patterns)
 :s (target->hop-keymaps :s-exp)
 :w (target->hop-keymaps :words)}
