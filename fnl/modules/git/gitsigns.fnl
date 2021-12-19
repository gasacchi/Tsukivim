;;(local keymaps 
;;  {:noremap true
;;   :buffer true
;;   "n <leader>gn" 
;;      {1 "&diff ? ']c' : ':lua require\"gitsigns\".next_hunk()<CR>'" 
;;       :expr true}
;;    "n <leader>gp" 
;;      {1 "&diff ? '[c' : ':lua require\"gitsigns\".prev_hunk()<CR>'"
;;       :expr true}
;;    "n <leader>gs" ":lua require'gitsigns'.stage_hunk()<CR>"
;;    "n <leader>gu" ":lua require'gitsigns'.undo_stage_hunk()<CR>"
;;    "n <leader>gr" ":lua require'gitsigns'.reset_hunk()<CR>"
;;    "n <leader>gR" ":lua require'gitsigns'.reset_buffer()<CR>"
;;    "n <leader>gP" ":lua require'gitsigns'.preview_hunk()<CR>"
;;    "n <leader>gb" ":lua require'gitsigns'.blame_line()<CR>"
;;    "o ih" ":<C-U>lua require'gitsigns'.select_hunk()<CR>"
;;    "x ih" ":<C-U>lua require'gitsigns'.select_hunk()<CR>"})
;;
;;(fn config []
;;  (let [gitsigns (require :gitsigns)]
;;    (gitsigns.setup 
;;      {: keymaps})))

(fn config [])
{: config}
