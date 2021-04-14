set_hl = (group, options) ->
  bg = options.bg == nil and '' or 'guibg=' .. options.bg
  fg = options.fg == nil and '' or 'guifg=' .. options.fg
  gui = options.gui == nil and '' or 'gui=' .. options.gui

  vim.cmd string.format 'hi %s %s %s %s', group, bg, fg, gui

{ :set_hl }
