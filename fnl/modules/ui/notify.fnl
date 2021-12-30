;; Module for configure notify
(local {: require-plugin} (require :lib.tsukivim))

(let [(ok? notify) (require-plugin :notify)]
  (when ok?
    (notify.setup 
      {:stages :fade
       :background_colour "#16161D"})))

