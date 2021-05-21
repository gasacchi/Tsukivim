local yuno               = require'modules.ui.palette'.yuno

local gl                 = require'galaxyline'
local provider_fileinfo  = require'galaxyline.provider_fileinfo'
local condition          = require'galaxyline.condition'
local section            = gl.section

gl.short_line_list       = { 'Minimap', 'NvimTree','vista','dbui','packer' }
my_icons                 = provider_fileinfo.define_file_icon()
my_icons['purs']         = { yuno.white, '<≡>'}

-- TODO                  = Need fix for short line and replace mode broken
local vim_mode           = {
  n                      = {
    name                 = 'normal',
    hl                   = yuno.green,
  },
  i                      = {
    name                 = 'insert',
    hl                   = yuno.yellow,
  },
  v                      = {
    name                 = 'visual',
    hl                   = yuno.blue,
  },
  [""]                 = {
    name                 = 'v-block',
    hl                   = yuno.blue,
  },
  V                      = {
    name                 = 'v-line',
    hl                   = yuno.blue,
  },
  c                      = {
    name                 = 'command',
    hl                   = yuno.red,
  },
  no                     = {
    name                 = 'n-pending',
    hl                   = yuno.green,
  },
  s                      = {
    name                 = 'select',
    hl                   = yuno.altblue,
  },
  S                      = {
    name                 = 's-block',
    hl                   = yuno.altblue,
  },
  [""]                 = {
    name                 = 's-line',
    hl                   = yuno.altblue,
  },
  ic                     = {
    name                 = 'insert',
    hl                   = yuno.yellow,
  },
  R                      = {
    name                 = 'replace',
    hl                   = yuno.purple,
  },
  Rv                     = {
    name                 = 'v-replace',
    hl                   = yuno.purple,
  },
  cv                     = {
    name                 = 'vim-ex',
    hl                   = yuno.red,
  },
  ce                     = {
    name                 = 'ex',
    hl                   = yuno.red,
  },
  r                      = {
    name                 = 'prompt',
    hl                   = yuno.cyan,
  },
  rm                     = {
    name                 = 'more',
    hl                   = yuno.cyan,
  },
  ["r?"]                 = {
    name                 = 'confirm',
    hl                   = yuno.cyan,
  },
  ["!"]                  = {
    name                 = 'shell',
    hl                   = yuno.red,
  },
  t                      = {
    name                 = 'terminal',
    hl                   = yuno.red,
  },
}

-- ---------------------------------------------------------------------------
-- Left Bar 
-- ---------------------------------------------------------------------------

section.left[1]          = {
  space                  = {
    provider             = function() return '  ' end,
    highlight            = { 'NONE', yuno.black},
  },
}

section.left[2]          = {
  moon                   = {
    provider             = function() return ' ' end,
    highlight            = { yuno.red, yuno.black  , 'bold' },
  },
}

section.left[3]          = {
  has                    = {
    provider             = function() return ':: ' end,
    highlight            = { yuno.green, yuno.black },
  },
}


section.left[4]          = {
  mode                   = {
    provider             = function() return 'Mode ' end,
    highlight            = { yuno.magenta, yuno.black, 'bold' },
  },
}

section.left[5]          = {
  viModeMoon             = {
    provider             = function()
      current_mode       = vim_mode[vim.fn.mode()]
      vim.cmd('hi GalaxyviModeMoon guifg=' .. current_mode.hl)
      return '  ' end,
    highlight            = { yuno.magenta, yuno.black },
  },
}

section.left[6]          = {
  cons                   = {
    provider             = function() return '→ ' end,
    highlight            = { yuno.yellow, yuno.black },
    condition            = condition.buffer_not_empty,
  },
}

section.left[7]          = {
  sep1                   = {
    provider             = function() return '( ' end,
    highlight            = { yuno.blue, yuno.black },
    condition            = condition.buffer_not_empty,
  },
}

section.left[8]          = {
  viModeName             = {
    provider             = function() 
      current_mode       = vim_mode[vim.fn.mode()]
      vim.cmd('hi GalaxyviModeName guifg=' .. current_mode.hl)
      return current_mode.name end,
    condition            = condition.buffer_not_empty,
    highlight            = { yuno.blue, yuno.black },
 },
}

section.left[9]          = {
  comma                  = {
    provider             = function() return ', ' end,
    highlight            = { yuno.blue, yuno.black },
    condition            = condition.buffer_not_empty,
  },
}

section.left[10]         = {
  FileName               = {
    provider             = 'FileName',
    condition            = condition.buffer_not_empty,
    highlight            = { yuno.yellow, yuno.black },
  },
}

section.left[11]         = {
  sep2                   = {
    provider             = function() return ') ' end,
    highlight            = { yuno.blue, yuno.black },
    condition            = condition.buffer_not_empty,
  }
}

-- ----------------------------------------------------------------------------
-- Right Bar 
-- ----------------------------------------------------------------------------

section.right[1]         = {
  rightparent1           = {
    provider             = function() return '( ' end,
    highlight            = { yuno.blue, yuno.black },
  },
}

section.right[2]         = {
  fileIcon               = {
    provider             = 'FileIcon',
    condition            = condition.buffer_not_empty,
    highlight            = { yuno.blue, yuno.black },
  },
}

section.right[3]         = {
  fileNameType           = {
    provider             = 'FileTypeName',
    highlight            = { yuno.magenta, yuno.black },
  },
}

section.right[4]         = {
  space2                 = {
    provider             = function() return ' ' end,
    highlight            = { yuno.yellow, yuno.black },
  },
}

section.right[5]         = {
  cons2                  = {
    provider             = function() return '⇒ ' end,
    highlight            = { yuno.yellow, yuno.black },
    condition            = condition.buffer_not_empty,
  },
}

section.right[6]         = {
  fileSize               = {
    provider             = 'FileSize',
    highlight            = { yuno.red, yuno.black },
    condition            = condition.buffer_not_empty,
  },
}

section.right[7]         = {
  rightparent2           = {
    provider             = function() return ') ' end,
    highlight            = { yuno.blue, yuno.black },
  },
}

section.right[8]         = {
  rightArrow             = {
    provider             = function() return '← ' end,
    highlight            = { yuno.yellow, yuno.black },
    condition            = condition.buffer_not_empty,
  },
}

section.right[9]         = {
  linesep1               = {
    provider             = function() return '[ ' end,
    highlight            = { yuno.blue, yuno.black },
    condition            = condition.buffer_not_empty,
  },
}

section.right[10]        = {
  lineColumn             = {
    provider             = 'LineColumn',
    highlight            = { yuno.yellow, yuno.black },
    condition            = condition.buffer_not_empty,
  },
}

section.right[11]        = {
  linePercentSep         = {
    provider             = function() return ': ' end,
    highlight            = { yuno.blue, yuno.black },
    condition            = condition.buffer_not_empty,
  },
}

section.right[12]        = {
  linePercent            = {
    provider             = 'LinePercent',
    highlight            = { yuno.green, yuno.black },
    condition            = condition.buffer_not_empty,
  },
}

section.right[13]        = {
  linesep2               = {
    provider             = function() return '] ' end,
    highlight            = { yuno.blue, yuno.black },
    condition            = condition.buffer_not_empty,
  }
}

-- ----------------------------------------------------------------------------
-- Middle Bar 
-- ----------------------------------------------------------------------------

--mid[1]                 =
--  DiagnosticError      =
--    provider           = 'DiagnosticError',
--    icon               = '  ',
--    highlight          = { yuno.red }
--
--mid[2]                 =
--  DiagnosticWarn       =
--    provider           = 'DiagnosticWarn',
--    icon               = '  ',
--    highlight          = { yuno.yellow },
--
--mid[3]                 =
--  DiagnosticHint       =
--    provider           = 'DiagnosticHint',
--    icon               = '  ',
--    highlight          = { yuno.cyan },
--
--mid[4]                 =
--  DiagnosticInfo       =
--    provider           = 'DiagnosticInfo',
--    icon               = '  ',
--    highlight          = { yuno.blue },
--
-- ----------------------------------------------------------------------------
-- Inactive & Short Left Bar 
-- ----------------------------------------------------------------------------
section.short_line_left[1]  = {
  BufferType                = {
    provider                = 'FileTypeName',
    separator               = ' ',
    separator_highlight     = { 'NONE', yuno.black },
    highlight               = { yuno.red, yuno.black, 'bold' },
  },
}

section.short_line_left[2]  = {
  FileName                  = {
    provider                ='SFileName',
    condition               = condition.buffer_not_empty,
    highlight               = { yuno.red, yuno.black },
  },
}

-- ----------------------------------------------------------------------------
-- Inactive & Short Right Bar 
-- ----------------------------------------------------------------------------
section.short_line_right[1]   = {
  BufferIcon                  = {
    provider                  = 'BufferIcon',
    highlight                 = { yuno.fg, yuno.black },
  },
}
