import let, set, cmd from require'modules.builtin'
import keymap, exec from require'modules.builtin'.api

-- TODO: whichkey not show name for lsp mappings


-- Set Global Option
set.o 'backup', false
set.o 'writebackup', false
-- set.o 'cmdheight', 1
set.o 'updatetime', 300
set.w 'signcolumn', 'number'

let 'coc_global_extensions', {'coc-json'}

exec [[
  function! g:Check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  ]], false

keymap 'i', '<Tab>',
  'pumvisible() ? "<C-n>" : g:Check_back_space() ? "<TAB>" : coc#refresh()',
  { expr: true, silent: true }

keymap 'i', '<S-Tab>',
  'pumvisible() ? "<C-p>" : "<C-h>"',
  expr: true 

keymap 'i', '<c-space>',
  'coc#refresh()',
  { expr: true, silent: true }

keymap 'i', '<cr>',
  'pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"',
  { expr: true, silent: true, noremap: true }

-- show documentation
exec [[
  function! g:Show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
  endfunction
  ]], false


exec [[
  augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
  ]], false

exec [[
 " Remap <C-f> and <C-b> for scroll float windows/popups.
 if has('nvim-0.4.0') || has('patch-8.2.0750')
 nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
 nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
 inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
 inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
 vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
 vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
 endif
 ]], false


-- Highlight the symbol and its references when holding the cursor.
cmd 'autocmd CursorHold * silent call CocActionAsync("highlight")'
-- Add `:Format` command to format current buffer.
cmd 'command! -nargs=0 Format :call CocAction("format")'

-- Add `:Fold` command to fold current buffer.
cmd 'command! -nargs=? Fold :call CocAction("fold", <f-args>)'

-- Add `:OR` command for organize imports of the current buffer.
cmd 'command! -nargs=0 OR   :call CocAction("runCommand", "editor.action.organizeImport")'

