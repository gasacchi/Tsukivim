import cmd from vim
import nvim_buf_set_keymap, nvim_buf_set_option,nvim_exec from vim.api
import purescriptls from require "lspconfig"



cmd 'set completeopt=menuone,noinsert,noselect'

on_attach = (client, bufnr) ->
  buf_set_keymap = (...) -> nvim_buf_set_keymap bufnr, ...
  buf_set_option = (...) -> nvim_buf_set_option bufnr, ...

  -- Mappings.
  opts = noremap:true, silent:true

  buf_set_keymap 'n', '<leader>lD', 
    '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts
  buf_set_keymap 'n', '<leader>ld', 
    '<Cmd>lua vim.lsp.buf.definition()<CR>', opts
  buf_set_keymap 'n', '<leader>lh', 
    '<Cmd>lua vim.lsp.buf.hover()<CR>', opts
  buf_set_keymap 'n', '<leader>li', 
    '<cmd>lua vim.lsp.buf.implementation()<CR>', opts
  buf_set_keymap 'n', '<leader>lH', 
    '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts
  buf_set_keymap 'n', '<leader>lwa', 
    '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts
  buf_set_keymap 'n', '<leader>lwr', 
    '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts
  buf_set_keymap 'n', '<leader>lwl', 
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts
  buf_set_keymap 'n', '<leader>lt', 
    '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts
  buf_set_keymap 'n', '<leader>lR', 
    '<cmd>lua vim.lsp.buf.rename()<CR>', opts
  buf_set_keymap 'n', '<leader>lr', 
    '<cmd>lua vim.lsp.buf.references()<CR>', opts
  buf_set_keymap 'n', '<leader>le', 
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts
  buf_set_keymap 'n', '<leader>lp', 
    '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts
  buf_set_keymap 'n', '<leader>ln', 
    '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts
  buf_set_keymap 'n', '<leader>ls', 
    '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting
    buf_set_keymap "n", "<leader>cf", 
      "<cmd>lua vim.lsp.buf.formatting()<CR>", opts
  elseif client.resolved_capabilities.document_range_formatting
    buf_set_keymap "n", "<leader>cF", 
      "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight
    nvim_exec " 
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ", false

purescriptls.setup :on_attach

