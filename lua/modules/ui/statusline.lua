local statusline = {}

statusline.config = function()
  require'lualine'.setup{
    opitons = {
      themes = 'tokyonight'
    }
  }
end

return statusline
