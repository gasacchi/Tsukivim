local bufferline = {}

bufferline.config = function()
   require'bufferline'.setup{
     options = {
       -- numbers = 'buffer_id',
      numbers = 'ordinal',
      view = 'multiwindow',
      modified_icon = '',
      indicator_icon = '  ',
      buffer_close_icon = '﯇',
      offsets = {{filetype = "NvimTree", text = "File Explorer" , text_align = "center" }},
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
         return "[" .. count .. "]"
      end
     }
   }
end

return bufferline
