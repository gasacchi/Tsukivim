;; Module for configure telescope
(local tsv (require :lib.tsukivim))

(local opts 
  {:pickers {:find_files {:theme :ivy}}
   :extensions {:project {:base_dirs ["~/.dev/github"
                                      "~/.dev/job"]}}})

(let [(ok? telescope) (tsv.require-plugin :telescope)]
    (if ok?
     (telescope.setup opts) 
     (tsv.load-plugin :telescope-fzf-native.nvim)
     (telescope.load_extension :fzf)
     :otherwise (tsv.notify.error "Cannot load telescope.nvim"
                                  "Plugin: telescope.nvim")))

