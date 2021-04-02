-- TODO: customize dashboard
import cmd, g from vim


o
g.dashboard_default_executive = "telescope"

g.dashboard_custom_shortcut   =
  last_session:               "SPC s l"
  find_history:               "SPC s h"
  find_file:                  "SPC .  "
  new_file:                   "SPC f n"
  change_colorscheme:         "SPC s c"
  find_word:                  "SPC s s"
  book_marks:                 "SPC s b"

-- cmd ("let g:dashboard_custom_footer = "Hello World"")

-- g.dashboard_custom_shortcut_icon = {
  -- last_session = " ",
  -- find_history = "ﭯ ",
  -- find_file = " ",
  -- new_file = " ",
  -- change_colorscheme = " ",
  -- find_word = " ",
  -- board_custom_shortcut_icon.book_marks = " "
-- }
