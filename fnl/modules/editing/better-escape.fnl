;; Module for configure better-escape

(local {: require-plugin} (require :lib.tsukivim))

(let [(ok? better-escape) (require-plugin :better_escape)]
  (when ok?
    (better-escape.setup)))

