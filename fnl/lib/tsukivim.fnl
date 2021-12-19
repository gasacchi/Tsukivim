(fn plugin-exist? [name]
	(= (vim.fn.empty 
				 (vim.fn.glob 
					 (.. (vim.fn.stdpath :data) "/site/pack/packer/start/" name))) 0))

{: plugin-exist?}
