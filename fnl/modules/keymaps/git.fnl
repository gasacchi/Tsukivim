;; Module contians git related keymaps

(local neogit-keys (require :modules.neogit.keymaps))
(local gitsigns-keys (require :modules.gitsigns.keymaps))

{:normal (vim.tbl_extend :keep {:name :Git} gitsigns-keys.normal neogit-keys.normal)
 :visual gitsigns-keys.visual}

