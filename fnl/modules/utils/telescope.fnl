;; Module for configure telescope
(local {: require-plugin : load-plugin : cmd} (require :lib.tsukivim))

(local opts 
  {:pickers {:find_files {:theme :ivy}}
   :extensions {:project {:base_dirs ["~/.dev/github"
                                      "~/.dev/job"]}}})

(let [(ok? telescope) (require-plugin :telescope)]
    (when ok?
     (telescope.setup opts) 
     (load-plugin :telescope-fzf-native.nvim)
     (telescope.load_extension :fzf)))

