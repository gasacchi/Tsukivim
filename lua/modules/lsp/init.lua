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
local servers = { 'svelte', 'elmls', 'cssls', 'html' }
local nvim_lsp = require'lspconfig'

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup(config)
end

nvim_lsp.tailwindcss.setup({
  capabilities = config.capabilities,
  on_attach = on_attach,
  filetypes = { "elm", "ejs", "html", "markdown", "mdx", "css", "less", "postcss", "sass", "scss", "stylus", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" },
  --[[ init_options = {
    userLanguages = {
      elm = "html"
    }
  }, ]]
  on_new_config = function(new_config)
    if not new_config.settings then
      new_config.settings = {
      }
    end
    if not new_config.settings.editor then
      new_config.settings.editor = {
      }
    end
    if not new_config.settings.editor.tabSize then
      -- set tab size for hover
      new_config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
    end
  end,
})
