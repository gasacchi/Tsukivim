-- Init module for Tsukivim
local fn = vim.fn

local hotpot_path = fn.stdpath('data') .. '/site/pack/packer/start/hotpot.nvim'

-- automatic install hotpot fennel if not installed
if fn.empty(fn.glob(hotpot_path)) > 0 then
	vim.cmd 
	  [[echohl WarningMsg | echon "Could not find hotpot.nvim" | echo "cloning the repo to:"]]
  print(hotpot_path, "\n")
  fn.system
	  { 'git'
	  , 'clone'
	  , 'https://github.com/rktjmp/hotpot.nvim'
	  , hotpot_path
	  }
end

local packer_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- automatic install packer if not installed
if fn.empty(fn.glob(packer_path)) > 0 then
	vim.cmd 
	  [[echohl WarningMsg | echon "Could not find packer.nvim" | echo "cloning the repo to:"]]
  print(packer_path, "\n")
  packer_bootstrap = fn.system
	  { 'git'
	  , 'clone'
	  , '--depth'
	  , '1'
	  , 'https://github.com/wbthomason/packer.nvim'
	  , packer_path
  	  }
end

-- bootstrap .fnl support
require("hotpot")

-- require Tsukivim configuration
require("tsukivim")
