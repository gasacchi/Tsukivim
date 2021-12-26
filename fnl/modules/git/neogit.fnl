;; Module for configure neogit
(local {: require-plugin} (require :lib.tsukivim))

(fn config []
  "Run after neogit is loaded"
   (let [(ok? neogit) (require-plugin :neogit)]
    (when ok?
      (neogit.setup))))

{: config}
