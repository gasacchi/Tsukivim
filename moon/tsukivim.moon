init = ->
  -- Configuration
  require'tsukivim.config'.setup!
  
  -- Modules
  require'tsukivim.modules'.loads!
  
  -- LSP Configuration
  require'tsukivim.lsp'.setup!

  -- UI
  require'tsukivim.ui'.render!

{ :init }
