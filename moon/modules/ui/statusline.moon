import yuno from require'modules.ui.palette'
import set_hl from require'modules.utility.highlight'

import short_line_list from require'galaxyline'
import right, left, mid from require'galaxyline'.section
import buffer_not_empty from require'galaxyline.condition'
import define_file_icon from require('galaxyline.provider_fileinfo')

short_line_list = { 'Minimap', 'NvimTree','vista','dbui','packer' }
my_icons = define_file_icon!
my_icons['moon'] = { yuno.white, ' '}

mode =
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

left[1] =
  space:
    provider: -> '  '

left[2] =
  moon:
    provider: -> ' '
    highlight: { yuno.red, yuno.bg, 'bold' }

left[3] =
  has:
    provider: -> ':: '
    highlight: { yuno.green, yuno.bg }


left[4] =
  mode:
    provider: -> 'Mode '
    highlight: { yuno.magenta, yuno.bg, 'bold' }

left[5] =
  viModeMoon:
    provider: ->
      current_mode = mode[vim.fn.mode!]
      set_hl 'GalaxyviModeMoon', fg:current_mode.hl
      '  '

left[6] =
  cons:
    provider: -> '→ '
    highlight: { yuno.yellow, yuno.bg }
    condition: buffer_not_empty

left[7] =
  sep1:
    provider: -> '( '
    highlight: { yuno.blue, yuno.bg }
    condition: buffer_not_empty

left[8] =
  viModeName:
    provider: ->
      current_mode = mode[vim.fn.mode!]
      set_hl 'GalaxyviModeName', fg:current_mode.hl
      current_mode.name
    condition: buffer_not_empty

left[9] =
  comma:
    provider: -> ', '
    highlight: { yuno.blue, yuno.bg }
    condition: buffer_not_empty

left[10] =
  FileName:
    provider: 'FileName'
    condition: buffer_not_empty
    highlight: { yuno.yellow, yuno.bg }

left[11] =
  sep2:
    provider: -> ') '
    highlight: { yuno.blue, yuno.bg }
    condition: buffer_not_empty

-- Right Bar ------------------------------------------------------------------
right[1] =
  rightparent1:
    provider: -> '( '
    highlight: { yuno.blue, yuno.bg }

right[2] =
  fileIcon:
    provider: 'FileIcon'
    condition: buffer_not_empty
    highlight: { yuno.blue, yuno.bg }

right[3] =
  fileNameType:
    provider: 'FileTypeName'
    highlight: { yuno.magenta, yuno.bg }

right[4] =
  space2:
    provider: -> ' '
    highlight: { yuno.yellow, yuno.bg }

right[5] =
  cons2:
    provider: -> '⇒ '
    highlight: { yuno.yellow, yuno.bg }
    condition: buffer_not_empty

right[6] =
  fileSize:
    provider: 'FileSize'
    highlight: { yuno.red, yuno.bg }
    condition: buffer_not_empty

right[7] =
  rightparent2:
    provider: -> ') '
    highlight: { yuno.blue, yuno.bg }

right[8] =
  rightArrow:
    provider: -> '← '
    highlight: { yuno.yellow, yuno.bg }
    condition: buffer_not_empty

right[9] =
  linesep1:
    provider: -> '[ '
    highlight: { yuno.blue, yuno.bg }
    condition: buffer_not_empty

right[10] =
  lineColumn:
    provider: 'LineColumn'
    highlight: { yuno.yellow, yuno.bg }
    condition: buffer_not_empty

right[11] =
  linePercentSep:
    provider: -> ':'
    highlight: { yuno.blue, yuno.bg }
    condition: buffer_not_empty

right[12] =
  linePercent:
    provider: 'LinePercent'
    highlight: { yuno.green, yuno.bg }
    condition: buffer_not_empty

right[13] =
  linesep2:
    provider: -> '] '
    highlight: { yuno.blue, yuno.bg }
    condition: buffer_not_empty

