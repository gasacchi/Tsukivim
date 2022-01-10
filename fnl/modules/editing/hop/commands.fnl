;; Modules contains hop.nvim commands
(local tsv (require :lib.tsukivim))

(fn target->hop-commands [target]
  "Generate hop commands with various behaviour"
  (let [(ok? hop) (tsv.require-plugin :hop)
        BEFORE-CURSOR 1 
        AFTER-CURSOR 2
        cmd {}]
    (if ok?
      (let [hint (match target 
                   :words (. hop :hint_words)
                   :patterns (. hop :hint_patterns)
                   :one-char (. hop :hint_char1)
                   :two-char (. hop :hint_char2)
                   :lines (. hop :hint_lines)
                   :line-starts (. hop :hint_lines_skip_whitespace)
                   :s-exp (. hop :hint_patterns)
                   _ (tsv.notify.error (.. "Invalid target" target) 
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
             cmd)) ;; return cmd
      :otherwise (tsv.notify.error hop "Hop: target->hop-commands"))))

(local lines
  (let [{: all : before-cursor : after-cursor} (target->hop-commands :lines)]
    {: all : before-cursor : after-cursor}))

(local line-starts
  (let [{: all : before-cursor : after-cursor} (target->hop-commands :line-starts)]
    {: all : before-cursor : after-cursor}))

{:words (target->hop-commands :words)
 :patterns (target->hop-commands :patterns)
 :one-char (target->hop-commands :one-char)
 :two-char (target->hop-commands :two-char)
 : lines
 : line-starts
 :s-exp (target->hop-commands :s-exp)}

