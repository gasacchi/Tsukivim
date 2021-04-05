import cmd, g from vim

g.dashboard_default_executive = "telescope"
g.dashboard_preview_command = 'cat'
g.dashboard_preview_pipeline = 'lolcat'
g.dashboard_preview_file = "~/.config/nvim/assets/tsukivim.cat"
g.dashboard_preview_file_height = 10
g.dashboard_preview_file_width = 80
g.dashboard_custom_footer = {"(code ∘ solve) (problems)"}
g.dashboard_custom_shortcut   =
  last_session:               "SPC f l"
  find_history:               "SPC s h"
  find_file:                  "SPC s f"
  new_file:                   "SPC f n"
  change_colorscheme:         "SPC s ,"
  find_word:                  "SPC s ."
  book_marks:                 "SPC s m"

