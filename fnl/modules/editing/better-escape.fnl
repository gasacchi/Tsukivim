;; Module for configure better-escape

(local {: plugin-exist?} (require :lib.tsukivim))

(fn config []
  (when (plugin-exist? :better-escape.nvim)
    (let [better-escape (require :better_escape)]
      (better-escape.setup))))

{: config}
