local actions = require'telescope.actions'
local previewers = require('telescope.previewers')
local Job = require('plenary.job')

local telescope = {}

telescope.config = function()
  -- Snippet for not showing previewer for binary files
  local new_maker = function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    Job:new({
      command = 'file',
      args = { '--mime-type', '-b', filepath },
      on_exit = function(j)
        local mime_type = vim.split(j:result()[1], '/')[1]
        if mime_type == "text" then
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        else
          -- maybe we want to write something to the buffer here
          vim.schedule(function()
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'BINARY' })
          end)
        end
      end
    }):sync()
  end

  -- TODO: use different theme each picker
  require'telescope'.setup{
    defaults = {
      mappings = {
        i = {
          ["jk"] = actions.close -- use jk to close telescope
        },
      },
      buffer_previewer_maker = new_maker,
    },
  }

end

telescope.native_config = function()
  require'telescope'.load_extension('fzf')
end

return telescope
