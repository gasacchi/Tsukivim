;; Modules contains hop.nvim commands
(local lib (require :lib.tsukivim))

(fn target->hop-commands [target]
  "Generate hop commands with various behaviour"
  (let [(ok? hop) (lib.require-plugin :hop)
        hint (match target
               :word :hint_words
               :pattern :hint_patterns
               :one-char :hint_char1
               :two-char :hint_char2
               :line :hint_lines
               :line-start :hint_lines_skip_whitespace
               _ (lib.notify.error (.. "Invalid target: " target) "Hop: target->hop-commands"))
        BEFORE-CURSOR 1 
        AFTER-CURSOR 2
        cmd {}]
    (if ok?
      (do 
        (tset cmd :all 
              (fn []
                ((. hop hint) {})))
        (tset cmd :current-line
              (fn []
                ((. hop hint) {:current_line_only true})))
        (tset cmd :before-cursor
              (fn []
                ((. hop hint) {:direction BEFORE-CURSOR})))
        (tset cmd :after-cursor
              (fn []
                ((. hop hint) {:direction AFTER-CURSOR})))
        (tset cmd :before-cursor-current-line
              (fn []
                ((. hop hint) {:direction BEFORE-CURSOR
                               :current_line_only true})))
        (tset cmd :after-cursor-current-line
              (fn []
                ((. hop hint) {:direction AFTER-CURSOR
                               :current_line_only true})))
        cmd) ;; return commands
      :otherwise (lib.notify.error hop ""))))

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
 : line-start}

