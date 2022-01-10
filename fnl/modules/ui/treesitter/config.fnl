;; Module for configure nvim-treesitter
(local tsv (require :lib.tsukivim))

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
   :yaml
   :rust])

(let [(ok? treesitter) (tsv.require-plugin :nvim-treesitter.configs)]
  (if ok?
    (treesitter.setup
      {:ensure_installed syntax
       :rainbow {:enable true 
                 :extended_mode true
                 :max_file_lines nil}})
    :otherwise (tsv.notify "Cannot load nvim-treesitter.nvim"
                           "Plugin: nvim-treesitter.nvim")))

