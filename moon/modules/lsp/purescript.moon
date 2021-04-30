import cmd from require'modules.builtin'

-- purescript Unicode shortcut
cmd "autocmd FileType purescript inoremap <buffer> ;l ∀<Space>"
cmd "autocmd FileType purescript inoremap <buffer> ;h <space>∷<Space>"
cmd "autocmd FileType purescript inoremap <buffer> ;d ←<Space>"
cmd "autocmd FileType purescript inoremap <buffer> ;t →<Space>"
cmd "autocmd FileType purescript inoremap <buffer> ;c ⇒<Space>"
cmd "autocmd FileType purescript inoremap <buffer> ;i ⇐<Space>"

-- auto type
cmd "autocmd FileType purescript inoremap <buffer> ;n <Esc>^<Esc>yt o<Esc>pa "
