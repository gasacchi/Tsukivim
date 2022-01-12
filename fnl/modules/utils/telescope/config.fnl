;; Module for configure telescope
(local tsv (require :lib.tsukivim))

(let [(ok? telescope) (tsv.require-plugin :telescope)
      opts {:pickers {:find_files {:theme :ivy}}
            :extensions {:project {:base_dirs ["~/.dev/github"
                                               "~/.dev/job"]}}}]
    (if ok?
     (do 
       (telescope.setup opts) 
       (tsv.load-plugin :telescope-fzf-native.nvim)
       (telescope.load_extension :fzf))
     :otherwise (tsv.notify.error telescope "modules.utils.telescope.config")))

