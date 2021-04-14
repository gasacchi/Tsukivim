import let, set, cmd from require'modules.builtin'
import keymap, exec from require'modules.builtin'.api


-- Set Global Option
set.o 'backup', false
set.o 'writebackup', false
set.o 'cmdheight', 2
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
cmd 'command! -nargs=? Fold :call     CocAction("fold", <f-args>)'

-- Add `:OR` command for organize imports of the current buffer.
cmd 'command! -nargs=0 OR   :call     CocAction("runCommand", "editor.action.organizeImport")'



-- Mappings
-- LSP mappings
lsp_opts =
  silent: true
-- hover to see documentation
keymap 'n', '<leader>lh', ':call g:Show_documentation()<cr>', lsp_opts
-- " Use `[g` and `]g` to navigate diagnostics
-- " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
keymap 'n', '<leader>ln', ':<Plug>(coc-diagnostic-next)<cr>', lsp_opts
keymap 'n', '<leader>lp', ':<Plug>(coc-diagnostic-prev)<cr>', lsp_opts

-- " GoTo code navigation.
keymap 'n', '<leader>ld', ':<Plug>(coc-definition)<cr>', lsp_opts
keymap 'n', '<leader>lt', ':<Plug>(coc-type-definition)<cr>', lsp_opts
keymap 'n', '<leader>li', ':<Plug>(coc-implementation)<cr>', lsp_opts
keymap 'n', '<leader>lr', ':<Plug>(coc-references)<cr>', lsp_opts

-- Symbol renaming.
keymap 'n', '<leader>lR', ':<Plug>(coc-rename)<cr>', {}

-- Formatting selected code.
keymap 'n', '<leader>lf', ':Format', {}

-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
keymap 'n', '<leader>la', ':<Plug>(coc-codeaction-selected)<cr>', {}

-- Remap keys for applying codeAction to the current buffer.
keymap 'n', '<leader>lc', ':<Plug>(coc-codeaction)<cr>', {}

-- Apply AutoFix to problem on the current line.
keymap 'n', '<leader>lq', ':<Plug>(coc-fix-current)<cr>', {}


-- COC List
coc_list_opts =
  nowait: true
  silent: true

-- Show all diagnostics
keymap 'n', '<leader>lla', ':<C-u>CocList diagnostics<cr>', coc_list_opts
-- Manage Extensions
keymap 'n', '<leader>lle', ':<C-u>CocList extensions<cr>', coc_list_opts
-- Show Commands
keymap 'n', '<leader>llc', ':<C-u>CocList commands<cr>', coc_list_opts
-- Find Symbol of current document
keymap 'n', '<leader>llo', ':<C-u>CocList outline<cr>', coc_list_opts
-- Search workspace symbols
keymap 'n', '<leader>lls', ':<C-u>CocList -I symbols<cr>', coc_list_opts
-- Do default action for next item
keymap 'n', '<leader>llj', ':<C-u>CocNext<cr>', coc_list_opts
-- Do default action for previous item
keymap 'n', '<leader>llk', ':<C-u>CocPrev<cr>', coc_list_opts
-- Resume latest COC list
keymap 'n', '<leader>llp', ':<C-u>CocListResume<cr>', coc_list_opts

