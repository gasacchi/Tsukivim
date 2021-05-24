local M = {}

function M.init ()
  -- core
  require'tsukivim.plugins'
  require'tsukivim.mappings'
	require'tsukivim.options'

  -- LSP
  require'modules.lsp' -- neovim lsp config
  require'modules.lsp.completion'
  require'modules.lsp.lspkindicons'

  -- utils
  require'modules.utils.hop'
  require'modules.utils.lazygit'
  require'modules.utils.neogit'
  require'modules.utils.nvimtree'
  require'modules.utils.telescope'

  -- ui
  require'modules.ui.colorscheme'
  require'modules.ui.bufferline'
  require'modules.ui.colorizer'
  require'modules.ui.dashboard'
  require'modules.ui.gitsigns'
  require'modules.ui.goyo'
  require'modules.ui.indentblankline'
  require'modules.ui.minimap'
  require'modules.ui.whichkey'
  require'modules.ui.statusline'
end

return M
