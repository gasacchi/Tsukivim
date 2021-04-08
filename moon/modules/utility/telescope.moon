import setup from require "telescope"
import get_fuzzy_file,
  get_generic_fuzzy_sorter
  from require "telescope.sorters"
import vim_buffer_cat,
  vim_buffer_qflist,
  vim_buffer_vimgrep,
  buffer_previewer_maker
  from require "telescope.previewers"

telescope_setup =
  defaults:
    vimgrep_arguments: {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    }
    prompt_position: "bottom"
    prompt_prefix: "  "
    selection_caret: "  "
    entry_prefix: "  "
    initial_mode: "insert"
    selection_strategy: "reset"
    sorting_strategy: "descending"
    layout_strategy: "horizontal"
    layout_defaults:
      horizontal:
        mirror: false
      vertical:
        mirror: false
    file_sorter:  get_fuzzy_file
    file_ignore_patterns: {}
    generic_sorter:  get_generic_fuzzy_sorter
    shorten_path: true
    winblend: 0
    width: 0.75
    preview_cutoff: 120
    results_height: 1
    results_width: 0.8
    border: {}
    -- borderchars: { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
    borderchars: { "═", "│", "═", "│", "╒", "╕", "╛", "╘" }
    color_devicons: true
    use_less: true
    set_env: { ["COLORTERM"]: "truecolor" } -- defaults nill
    file_previewer: vim_buffer_cat.new
    grep_previewer: vim_buffer_vimgrep.new
    qflist_previewer: vim_buffer_qflist.new


    -- Developer configurations: Not meant for general override
    buffer_previewer_maker: buffer_previewer_maker

setup telescope_setup
