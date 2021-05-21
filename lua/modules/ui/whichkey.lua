-- Not a fan of floating windows for this
vim.g.which_key_use_floating_win = 0

-- Hide status
vim.cmd "autocmd! FileType which_key"
vim.cmd "autocmd  FileType which_key set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 showmode ruler"

vim.o.timeoutlen = 500

-- Change highlight
-- cmd "highlight default link WhichKey          Operator"
-- cmd "highlight default link WhichKeySeperator Constant"
-- cmd "highlight default link WhichKeyGroup     Identifier"
-- cmd "highlight default link WhichKeyDesc      Function"
-- cmd "highlight default link WhichKeyFloating Pmenu"
