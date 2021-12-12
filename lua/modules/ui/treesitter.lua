local treesitter = {}

treesitter.config = function()
  require'nvim-treesitter.configs'.setup{
    ensure_installed = {
      -- Frontend
      "html",
      "css",
      "javascript",
      "jsdoc",
      "json",
      "svelte",
      "tsx",
      "typescript" ,

      -- neovim
      "lua",

      -- general
      "comment",
      "fish",
    }, 
  }
end

return treesitter
