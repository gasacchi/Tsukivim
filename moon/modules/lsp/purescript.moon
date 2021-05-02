import cmd from require'modules.builtin'

-- purescript Unicode shortcut
cmd "autocmd FileType purescript inoremap <buffer> ;l ∀<Space>" -- forall
cmd "autocmd FileType purescript inoremap <buffer> ;h <space>∷<Space>" -- has type
cmd "autocmd FileType purescript inoremap <buffer> ;b ←<Space>" -- bind
cmd "autocmd FileType purescript inoremap <buffer> ;t →<Space>" -- type
cmd "autocmd FileType purescript inoremap <buffer> ;C ⇒<Space>" -- constraint
cmd "autocmd FileType purescript inoremap <buffer> ;i ⇐<Space>" -- impli

-- auto type
cmd "autocmd FileType purescript inoremap <buffer> ;n <Esc>yyp<Esc>wDA"
cmd "autocmd FileType purescript inoremap <buffer> ;c <Esc>yyp<Esc>wDa= <Esc>2gea "
