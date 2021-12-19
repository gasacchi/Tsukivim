;; Module for configure telescope
(local {: plugin-exist?} (require :lib.tsukivim))

(fn config []
    "Function that run after telescope.nvim loaded"
    (when (plugin-exist? :telescope.nvim)
        (let [telescope (require :telescope)]
            (telescope.setup)
            ;; Issue when using (telescope.load_extension :fzf)
            ;; when running PackerCompile 
            ;; packer compile error syntax "<" at
            ;; telescope-native-fzf config table
            ;; this line fixed it, not pretty but works
            (lua "require'telescope'.load_extension('fzf')"))))
        
    


{: config}
