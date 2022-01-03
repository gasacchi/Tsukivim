;; Module for configure telescope
(local {: require-plugin} (require :lib.tsukivim))

(local opts 
  {:pickers {:find_files {:theme :ivy}}})

(let [(ok? telescope) (require-plugin :telescope)]
    (when ok?
     (telescope.setup opts) 
     (telescope.load_extension :fzf)
     (telescope.load_extension :projects)))

