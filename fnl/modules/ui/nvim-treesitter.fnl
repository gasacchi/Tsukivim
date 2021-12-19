;; Module for configure nvim-treesitter
(local {: plugin-exist?} (require :lib.tsukivim))

;; List language syntax
(local syntax 
  [:bash
   :comment
   :css
   :fennel
   :fish
   :graphql
   :html
   :javascript
   :jsdoc
   :json
   :lua
   :prisma
   :python
   :regex
   :scss
   :svelte
   :toml
   :tsx
   :typescript
   :yaml])

(fn config []
  "Function that run after nvim-treesitter is loaded"
  (when (plugin-exist? :nvim-treesitter)
     (let [nvim-treesitter (require :nvim-treesitter.configs)]
      (nvim-treesitter.setup 
        {:ensure_installed syntax
         :rainbow {:enable true 
                   :extended_mode true
                   :max_file_lines nil}}))))

{: config}
