import cmd, g, o from vim

-- Not a fan of floating windows for this
g.which_key_use_floating_win = 0

-- Hide status
cmd "autocmd! FileType which_key"
cmd "autocmd  FileType which_key set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 showmode ruler"

-- Show faster
o.timeoutlen = 300

-- Change highlight
-- cmd "highlight default link WhichKey          Operator"
-- cmd "highlight default link WhichKeySeperator Constant"
-- cmd "highlight default link WhichKeyGroup     Identifier"
-- cmd "highlight default link WhichKeyDesc      Function"
-- cmd "highlight default link WhichKeyFloating Pmenu"
