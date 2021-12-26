;; Module for configure nvim-treesitter
(local {: require-plugin} (require :lib.tsukivim))

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

(let [(ok? treesitter) (require-plugin :nvim-treesitter.configs)]
  (when ok?
    (treesitter.setup
      {:ensure_installed syntax
       :rainbow {:enable true 
                 :extended_mode true
                 :max_file_lines nil}})))

