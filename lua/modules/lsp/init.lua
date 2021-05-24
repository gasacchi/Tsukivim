local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- use nvim-compe instead
  --Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<leader>lD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<leader>ld', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>lh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>lH', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>lr', '<cmd>Trouble lsp_references()<CR>', opts)
  -- buf_set_keymap('n', '<leader>le', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<leader>le', '<cmd>Trouble lsp_document_diagnostics<CR>', opts)
  buf_set_keymap('n', '<leader>lp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>ln', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<leader>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>lq', '<cmd>Trouble quikfix<CR>', opts)
  buf_set_keymap('n', '<leader>lq', '<cmd>Trouble loclist<CR>', opts)
  buf_set_keymap('n', '<leader>lW', '<cmd>Trouble lsp_workspace_diagnostics<CR>', opts)
  buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'svelte', 'tsserver', 'html', 'jsonls', 'vls' }
for _, lsp in ipairs(servers) do
  if lsp == 'vls' then
    nvim_lsp[lsp].setup{ on_attach = on_attach, cmd = 'vls' }
  end
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

