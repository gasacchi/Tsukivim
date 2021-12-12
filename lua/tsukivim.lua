local tsukivim = {}

tsukivim.init = function()
  -- core
	require'tsukivim.options'
  require'tsukivim.plugins'
  require'tsukivim.mappings'

  require'modules.ui.gui'
  require'modules.ui.notify'
end

return tsukivim 
