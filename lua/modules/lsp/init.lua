-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer

-- Purescript psc-ide-config
-- vim.g.psc_ide_syntastic_mode = 0
--


local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- Trouble lsp mappings
  buf_set_keymap('n', '<leader>tq', ':TroubleToggle quickfix<CR>', opts)
  buf_set_keymap('n', '<leader>tl', ':TroubleToggle loclist<CR>', opts)
  buf_set_keymap('n', '<leader>tw', ':TroubleToggle lsp_workspace_diagnostics<CR>', opts)
  buf_set_keymap('n', '<leader>tr', ':TroubleToggle lsp_references<CR>', opts)
  buf_set_keymap('n', '<leader>td', ':TroubleToggle lsp_document_diagnostics<CR>', opts)

  -- Lsp and Lsp saga mappings
  buf_set_keymap('n', '<leader>l.', ':Lspsaga lsp_finder<CR>', opts)
  buf_set_keymap('n', '<leader>la', ':Lspsaga code_action<CR>', opts)
  buf_set_keymap('v', '<leader>la', ':<C-U>Lspsaga range_code_action<CR>', opts)
  buf_set_keymap('n', '<leader>lh', ':Lspsaga hover_doc<CR>', opts)
  buf_set_keymap("n", "<C-f>", ":lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>", opts)
  buf_set_keymap("n", "<C-b>", ":lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>", opts)
  buf_set_keymap('n', '<leader>lH', ':Lspsaga signature_help<CR>', opts)
  buf_set_keymap('n', '<leader>lR', ':Lspsaga rename<CR>', opts)
  buf_set_keymap('n', '<leader>ld', ':Lspsaga preview_definition<CR>', opts)
  buf_set_keymap('n', '<leader>lx', ':Lspsaga show_line_diagnostics<CR>', opts)
  buf_set_keymap('n', '<leader>lX', ':Lspsaga show_cursor_diagnostics<CR>', opts)
  buf_set_keymap('n', '<leader>lp', ':Lspsaga diagnostic_jump_prev<CR>', opts)
  buf_set_keymap('n', '<leader>ln', ':Lspsaga diagnostic_jump_next<CR>', opts)

  buf_set_keymap('n', '<leader>lD', ':lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<leader>li', ':lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>lwa', ':lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>lwr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>lwl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>lt', ':lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap("n", "<leader>lf", ":lua vim.lsp.buf.formatting()<CR>", opts)

  --[[ -- Purescript ide
  buf_set_keymap("n", "<leader>a/", ":Pcwd<cr>", opts)
  buf_set_keymap("n", "<leader>al", ":Plist<cr>", opts)
  buf_set_keymap("n", "<leader>aL", ":Pload!<cr>", opts)
  buf_set_keymap("n", "<leader>ab", ":Prebuild!<cr>", opts)
  buf_set_keymap("n", "<leader>ag", ":PaddClause<cr>", opts)
  buf_set_keymap("n", "<leader>aT", ":PaddType<cr>", opts)
  buf_set_keymap("n", "<leader>at", ":Ptype<cr>", opts)
  buf_set_keymap("n", "<leader>aa", ":Papply<cr>", opts)
  buf_set_keymap("n", "<leader>aA", ":Papply!<cr>", opts)
  buf_set_keymap("n", "<leader>ac", ":Pcase! ", {noremap = true})
  buf_set_keymap("n", "<leader>ai", ":Pimport<cr>", opts)
  buf_set_keymap("n", "<leader>aq", ":PaddImportQualifications<cr>", opts)
  buf_set_keymap("n", "<leader>aG", ":Pgoto<cr>", opts)
  buf_set_keymap("n", "<leader>ap", ":Pursuit<cr>", opts) ]]

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
  -- capabilities.textDocument.completion.completionItem.snippetSupport = true
  
  local cmp_nvim_lsp = require'cmp_nvim_lsp'
  local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

local config = make_config()
require'lspconfig'.svelte.setup(config)
require'lspconfig'.elmls.setup(config)

