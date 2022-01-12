;; Module contians git related keymaps

(local vim (require :lib.vim))

(local neogit-keys (require :modules.git.neogit.keymaps))
(local gitsigns-keys (require :modules.git.gitsigns.keymaps))

{:normal (vim.extend :keep {:name :Git} gitsigns-keys.normal neogit-keys.normal)
 :visual gitsigns-keys.visual}

