;; Module for configure zen-mode
(local {: require-plugin} (require :lib.tsukivim))

(let [(ok? zen-mode) (require-plugin :zen-mode)]
  (when ok?
    (zen-mode.setup)))
