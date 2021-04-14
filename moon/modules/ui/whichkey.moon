import let, set, cmd from require'modules.builtin'

-- Not a fan of floating windows for this
let 'which_key_use_floating_win', 0

-- Hide status
cmd "autocmd! FileType which_key"
cmd "autocmd  FileType which_key set laststatus=0 noshowmode noruler | autocmd BufLeave <buffer> set laststatus=2 showmode ruler"

set.o 'timeoutlen', 500

-- Change highlight
-- cmd "highlight default link WhichKey          Operator"
-- cmd "highlight default link WhichKeySeperator Constant"
-- cmd "highlight default link WhichKeyGroup     Identifier"
-- cmd "highlight default link WhichKeyDesc      Function"
-- cmd "highlight default link WhichKeyFloating Pmenu"
