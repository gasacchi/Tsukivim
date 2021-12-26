;; Module for configure telescope
(local {: require-plugin} (require :lib.tsukivim))

(let [(ok? telescope) (require-plugin :telescope)]
    (when ok?
     (telescope.setup)
    ;; Issue when using (telescope.load_extension :fzf)
    ;; when running PackerCompile 
    ;; packer compile error syntax "<" at
    ;; telescope-native-fzf config table
    ;; this line fixed it, not pretty but works
     (lua "require'telescope'.load_extension('fzf')")))
            

