;; Module for configure telescope
(local tsv (require :lib.tsukivim))

(let [(ok? telescope) (tsv.require-plugin :telescope)
      (ok-trouble? trouble) (tsv.require-plugin :trouble.providers.telescope)]
    (if (and ok? ok-trouble?)
     (do 
       ;; (telescope.setup opts) 
       (telescope.setup 
         {:pickers {:find_files {:theme :ivy}}
          :extensions {:project {:base_dirs ["~/.dev/github"
                                             "~/.dev/job"]}}
          :defaults {:mappings {:i {:<C-x> trouble.open_with_trouble}
                                :n {:<C-x> trouble.open_with_trouble}}}})
       (tsv.load-plugin :telescope-fzf-native.nvim)
       (telescope.load_extension :fzf))
     (not ok-trouble?)
     (tsv.notify.error trouble
                       [:module :modules.utils.telescope.config])
     :otherwise (tsv.notify.error telescope 
                                  [:module :modules.utils.telescope.config])))

