;; Modules contains hop.nvim commands
(local lib (require :lib.tsukivim))

;; FIX: s-exp
(fn target->hop-commands [target]
  "Generate hop commands with various behaviour"
  (let [(ok? hop) (lib.require-plugin :hop)
        BEFORE-CURSOR 1 
        AFTER-CURSOR 2
        cmd {}]
    (if ok?
      (let [hint (match target 
                   :word (. hop :hint_words)
                   :pattern (. hop :hint_patterns)
                   :one-char (. hop :hint_char1)
                   :two-char (. hop :hint_char2)
                   :line (. hop :hint_lines)
                   :line-start (. hop :hint_lines_skip_whitespace)
                   :s-exp (. hop :hint_patterns)
                   _ (lib.notify.error (.. "Invalid target" target) 
                                       "Hop: target->hop-commands"))
            s-exp-pattern (if (= target :s-exp)
                            "(\\|{\\|\\["
                            :otherwise nil)]
          (do 
             (tset cmd :all 
                   (fn []
                     (hint {} s-exp-pattern)))
             (tset cmd :current-line
                   (fn []
                     (hint {:current_line_only true} s-exp-pattern)))
             (tset cmd :before-cursor
                   (fn []
                     (hint {:direction BEFORE-CURSOR} s-exp-pattern)))
             (tset cmd :after-cursor
                   (fn []
                     (hint {:direction AFTER-CURSOR} s-exp-pattern)))
             (tset cmd :before-cursor-current-line
                   (fn []
                     (hint {:direction BEFORE-CURSOR
                            :current_line_only true} s-exp-pattern)))
             (tset cmd :after-cursor-current-line
                   (fn []
                     (hint {:direction AFTER-CURSOR
                            :current_line_only true} s-exp-pattern)))
             cmd))
      ; (do 
      ;   (tset cmd :all 
      ;         (fn []
      ;           ((. hop hint) {})))
      ;   (tset cmd :current-line
      ;         (fn []
      ;           ((. hop hint) {:current_line_only true})))
      ;   (tset cmd :before-cursor
      ;         (fn []
      ;           ((. hop hint) {:direction BEFORE-CURSOR})))
      ;   (tset cmd :after-cursor
      ;         (fn []
      ;           ((. hop hint) {:direction AFTER-CURSOR})))
      ;   (tset cmd :before-cursor-current-line
      ;         (fn []
      ;           ((. hop hint) {:direction BEFORE-CURSOR
      ;                          :current_line_only true})))
      ;   (tset cmd :after-cursor-current-line
      ;         (fn []
      ;           ((. hop hint) {:direction AFTER-CURSOR
      ;                          :current_line_only true})))
      ;   cmd) ;; return commands
      :otherwise (lib.notify.error hop "Hop: target->hop-commands"))))

(local line 
  (let [{: all : before-cursor : after-cursor} (target->hop-commands :line)]
    {: all : before-cursor : after-cursor}))

(local line-start
  (let [{: all : before-cursor : after-cursor} (target->hop-commands :line-start)]
    {: all : before-cursor : after-cursor}))

{:word (target->hop-commands :word)
 :pattern (target->hop-commands :pattern)
 :one-char (target->hop-commands :one-char)
 :two-char (target->hop-commands :two-char)
 : line
 : line-start
 :s-exp (target->hop-commands :s-exp)}

