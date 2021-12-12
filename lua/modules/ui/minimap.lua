local minimap = {}

minimap.config = function()
  vim.g.minimap_width = 15
  vim.g.minimap_block_filetypes = { 'tagbar', 'NvimTree' }
  vim.g.minimap_close_filetypes = { 'dashboard', 'netrw', 'packer' }
  vim.g.minimap_highlight = 'Error'
end

return minimap
