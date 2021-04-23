import cmd from require'modules.builtin'

-- purescript Unicode shortcut
cmd "autocmd FileType purescript inoremap <buffer> ;l ∀"
cmd "autocmd FileType purescript inoremap <buffer> ;h ∷"
cmd "autocmd FileType purescript inoremap <buffer> ;d ←"
cmd "autocmd FileType purescript inoremap <buffer> ;t →"
cmd "autocmd FileType purescript inoremap <buffer> ;c ⇒"
cmd "autocmd FileType purescript inoremap <buffer> ;i ⇐"
cmd "autocmd FileType purescript inoremap <buffer> ;n <Esc>0<Esc>yt o<Esc>pa "
