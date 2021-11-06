local M = {}


function M.init ()
  -- core
  require'tsukivim.plugins'
  require'tsukivim.mappings'
	require'tsukivim.options'
  -- LSP
  require'modules.lsp' -- neovim lsp config
  require'modules.lsp.completion'
  require'modules.lsp.trouble'
  require'modules.lsp.saga'

  -- Git Utils
  require'modules.git.neogit'
  require'modules.git.gitsigns'
  require'modules.git.gitblame'
  require'modules.git.lazygit'

  -- Editing
  require'modules.editing.kommentary'
  require'modules.editing.hop'

  -- utils
  require'modules.utils.nvimtree'
  require'modules.utils.telescope'
  require'modules.utils.todo-comments'
  -- require'modules.utils.tabout'

  -- ui
  require'modules.ui.colorscheme'
  require'modules.ui.bufferline'
  require'modules.ui.colorizer'
  require'modules.ui.dashboard'
  require'modules.ui.goyo'
  require'modules.ui.indentblankline'
  require'modules.ui.minimap'
  require'modules.ui.whichkey'
  require'modules.ui.statusline'
  require'modules.ui.treesitter'
  require'modules.ui.gui'
end

return M
