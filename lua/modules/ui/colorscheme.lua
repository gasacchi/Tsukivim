
-- vim.cmd 'let &termguicolors = !empty("$NVIM_TUI_ENABLE_TRUE_COLOR")'
-- vim.cmd [[let &t_8f = "\e[38;2;%lu;%lu;%lum"]]
-- vim.cmd [[let &t_8b = "\e[48;2;%lu;%lu;%lum"]]

vim.g.tokyonight_colors = {
  bg_dark = "#0a1719",
  bg_highlight = "#0a1719",
  terminal_black = "#0a1719",
  bg = "#101f22",
  bg_sidebar = "#0a1719",
  bg_float = "#0a1719",
  bg_popup = "#0a1719",
  black = "#0a1719",
}

vim.cmd[[colorscheme tokyonight]]

