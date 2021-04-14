import cmd, let from require'modules.builtin'

let 'dashboard_default_executive', "telescope"
let 'dashboard_preview_command', 'cat'
let 'dashboard_preview_pipeline', 'lolcat'
let 'dashboard_preview_file', "~/.config/nvim/assets/tsukivim.cat"
let 'dashboard_preview_file_height', 10
let 'dashboard_preview_file_width', 80
let 'dashboard_custom_footer', {"(code ∘ solve) (problems)"}
let 'dashboard_custom_shortcut',
  last_session:               "SPC f l"
  find_history:               "SPC s h"
  find_file:                  "SPC s f"
  new_file:                   "SPC f n"
  change_colorscheme:         "SPC s ,"
  find_word:                  "SPC s ."
  book_marks:                 "SPC s m"

