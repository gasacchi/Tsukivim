;; Module for configure nvim-treesitter
(local tsv (require :utils))

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
    :otherwise (tsv.notify.error treesitter
                                 [:module :modules.treesitter.config])))

