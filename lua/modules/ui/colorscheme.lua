local colorscheme = {}

colorscheme.config = function()
  require('github-theme').setup
    { theme_style = 'dark_default'
    , sidebars = { "qf", "vista_kind", "terminal", "packer", "nvim-tree" }
    , transparent = vim.g.nvui == nil
    }
end

return colorscheme
