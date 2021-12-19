;; Module for configure neogit
(local {: plugin-exist?} (require :lib.tsukivim))

(fn config []
  "Function that run after neogit is loaded"
  (when (plugin-exist? :neogit)
   (let [neogit (require :neogit)]
    (neogit.setup))))

{: config}
