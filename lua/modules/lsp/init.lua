-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- use nvim-compe instead
  --Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<leader>ld', '<cmd>Lspsaga preview_definition<CR>', opts)
  buf_set_keymap('n', '<leader>lh', '<cmd>Lspsaga hover_doc<CR>', opts)
  buf_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>lH', '<cmd>Lspsaga signature_help<CR>', opts)
  buf_set_keymap('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>lR', '<cmd>Lspsaga rename<CR>', opts)
  buf_set_keymap('n', '<leader>lx', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
  buf_set_keymap('n', '<leader>lX', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
  buf_set_keymap('n', '<leader>la', '<cmd>Lspsaga code_action<CR>', opts)
  buf_set_keymap('v', '<leader>la', '<cmd>Lspsaga range_code_action<CR>', opts)
  buf_set_keymap('n', '<leader>ls', '<cmd>Lspsaga lsp_finder<CR>', opts)
  buf_set_keymap('n', '<leader>lr', '<cmd>Trouble lsp_references<CR>', opts)
  buf_set_keymap('n', '<leader>le', '<cmd>Trouble lsp_document_diagnostics<CR>', opts)
  buf_set_keymap('n', '<leader>lp', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  buf_set_keymap('n', '<leader>ln', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  buf_set_keymap('n', '<leader>lq', '<cmd>Trouble quikfix<CR>', opts)
  buf_set_keymap('n', '<leader>ll', '<cmd>Trouble loclist<CR>', opts)
  buf_set_keymap('n', '<leader>lW', '<cmd>Trouble lsp_workspace_diagnostics<CR>', opts)
  buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  buf_set_keymap("n", "<C-f>", "<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>", opts)
  buf_set_keymap("n", "<C-b>", "<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>", opts)
end


local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  }
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end


local function setup_servers()
  require'lspinstall'.setup()

  -- get all installed servers
  local servers = require'lspinstall'.installed_servers()

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "lua" then
      config.settings = lua_settings
    end

    require'lspconfig'[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
