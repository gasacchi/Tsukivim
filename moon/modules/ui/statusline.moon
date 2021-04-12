import set_hl from require'modules.utility.highlight'
import yuno from require'modules.ui.palette'

import mode from vim.fn

import short_line_list from require'galaxyline'
import buffer_not_empty from require'galaxyline.condition'
import define_file_icon from require('galaxyline.provider_fileinfo')
import right,
  left,
  mid,
  short_line_left,
  short_line_right 
  from require'galaxyline'.section

short_line_list = { 'Minimap', 'NvimTree','vista','dbui','packer' }
my_icons = define_file_icon!
my_icons['moon'] = { yuno.white, ' '}
my_icons['purs'] = { yuno.white, '<≡>'}

vim_mode =
  n:
    name: 'normal'
    hl: yuno.green,
  i:
    name: 'insert'
    hl: yuno.yellow,
  v:
    name: 'visual'
    hl: yuno.blue,
  [""]:
    name: 'v-line'
    hl: yuno.blue,
  V:
    name: 'v-block'
    hl: yuno.blue,
  c:
    name: 'command'
    hl: yuno.red,
  no:
    name: 'n-pending'
    hl: yuno.green,
  s:
    name: 'select'
    hl: yuno.altblue,
  S:
    name: 's-block'
    hl: yuno.altblue,
  [""]:
    name: 's-line'
    hl: yuno.altblue,
  ic:
    name: 'insert'
    hl: yuno.yellow,
  R:
    name: 'replace'
    hl: yuno.purple,
  Rv:
    name: 'v-replace'
    hl: yuno.purple,
  cv:
    name: 'vim-ex'
    hl: yuno.red,
  ce:
    name: 'ex'
    hl: yuno.red,
  r:
    name: 'prompt'
    hl: yuno.cyan,
  rm:
    name: 'more'
    hl: yuno.cyan,
  ["r?"]:
    name: 'confirm'
    hl: yuno.cyan,
  ["!"]:
    name: 'shell'
    hl: yuno.red,
  t:
    name: 'terminal'
    hl: yuno.red

-- ----------------------------------------------------------------------------
-- Left Bar 
-- ----------------------------------------------------------------------------

left[1] =
  space:
    provider: -> '  '

left[2] =
  moon:
    provider: -> ' '
    highlight: { yuno.red, 'NONE' , 'bold' }

left[3] =
  has:
    provider: -> ':: '
    highlight: { yuno.green }


left[4] =
  mode:
    provider: -> 'Mode '
    highlight: { yuno.magenta, 'NONE', 'bold' }

left[5] =
  viModeMoon:
    provider: ->
      current_mode = vim_mode[mode!]
      set_hl 'GalaxyviModeMoon', fg:current_mode.hl
      '  '

left[6] =
  cons:
    provider: -> '→ '
    highlight: { yuno.yellow }
    condition: buffer_not_empty

left[7] =
  sep1:
    provider: -> '( '
    highlight: { yuno.blue }
    condition: buffer_not_empty

left[8] =
  viModeName:
    provider: ->
      current_mode = vim_mode[mode!]
      set_hl 'GalaxyviModeName', fg:current_mode.hl
      current_mode.name
    condition: buffer_not_empty

left[9] =
  comma:
    provider: -> ', '
    highlight: { yuno.blue }
    condition: buffer_not_empty

left[10] =
  FileName:
    provider: 'FileName'
    condition: buffer_not_empty
    highlight: { yuno.yellow }

left[11] =
  sep2:
    provider: -> ') '
    highlight: { yuno.blue }
    condition: buffer_not_empty

-- ----------------------------------------------------------------------------
-- Right Bar 
-- ----------------------------------------------------------------------------

right[1] =
  rightparent1:
    provider: -> '( '
    highlight: { yuno.blue }

right[2] =
  fileIcon:
    provider: 'FileIcon'
    condition: buffer_not_empty
    highlight: { yuno.blue }

right[3] =
  fileNameType:
    provider: 'FileTypeName'
    highlight: { yuno.magenta }

right[4] =
  space2:
    provider: -> ' '
    highlight: { yuno.yellow }

right[5] =
  cons2:
    provider: -> '⇒ '
    highlight: { yuno.yellow }
    condition: buffer_not_empty

right[6] =
  fileSize:
    provider: 'FileSize'
    highlight: { yuno.red }
    condition: buffer_not_empty

right[7] =
  rightparent2:
    provider: -> ') '
    highlight: { yuno.blue }

right[8] =
  rightArrow:
    provider: -> '← '
    highlight: { yuno.yellow }
    condition: buffer_not_empty

right[9] =
  linesep1:
    provider: -> '[ '
    highlight: { yuno.blue }
    condition: buffer_not_empty

right[10] =
  lineColumn:
    provider: 'LineColumn'
    highlight: { yuno.yellow }
    condition: buffer_not_empty

right[11] =
  linePercentSep:
    provider: -> ':'
    highlight: { yuno.blue }
    condition: buffer_not_empty

right[12] =
  linePercent:
    provider: 'LinePercent'
    highlight: { yuno.green }
    condition: buffer_not_empty

right[13] =
  linesep2:
    provider: -> '] '
    highlight: { yuno.blue }
    condition: buffer_not_empty

-- ----------------------------------------------------------------------------
-- Middle Bar 
-- ----------------------------------------------------------------------------

mid[1] =
  DiagnosticError:
    provider: 'DiagnosticError',
    icon: '  ',
    highlight: { yuno.red }

mid[2] =
  DiagnosticWarn:
    provider: 'DiagnosticWarn',
    icon: '  ',
    highlight: { yuno.yellow },

mid[3] =
  DiagnosticHint:
    provider: 'DiagnosticHint',
    icon: '  ',
    highlight: { yuno.cyan },

mid[4] =
  DiagnosticInfo:
    provider: 'DiagnosticInfo',
    icon: '  ',
    highlight: { yuno.blue },

-- ----------------------------------------------------------------------------
-- Inactive & Short Left Bar 
-- ----------------------------------------------------------------------------
short_line_left[1] =
  BufferType:
    provider: 'FileTypeName',
    separator: ' ',
    separator_highlight: { 'NONE', yuno.bg },
    highlight: {yuno.red, 'NONE', 'bold' }

short_line_left[2] =
  FileName:
    provider:'SFileName'
    condition: buffer_not_empty

-- ----------------------------------------------------------------------------
-- Inactive & Short Right Bar 
-- ----------------------------------------------------------------------------
short_line_right[1] =
  BufferIcon:
    provider: 'BufferIcon',
    highlight: { yuno.fg }
