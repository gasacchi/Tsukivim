;; Module for configure telescope
(local {: require-plugin} (require :lib.tsukivim))

(let [(ok? telescope) (require-plugin :telescope)]
    (when ok?
     (telescope.setup)
     (telescope.load_extension :fzf)))


