import setup from require "gitsigns"

gitsigns_setup =
  signs:
    add:
      hl:              "GitSignsAdd"
      text:            "│"
      numhl:           "GitSignsAddNr"
      linehl:          "GitSignsAddLn"
    change:
      hl:              "GitSignsChange"
      text:            "│"
      numhl:           "GitSignsChangeNr"
      linehl:          "GitSignsChangeLn"
    delete:
      hl:              "GitSignsDelete"
      text:            "│_"
      numhl:           "GitSignsDeleteNr"
      linehl:          "GitSignsDeleteLn"
    topdelete:
      hl:              "GitSignsDelete"
      text:            "│‾"
      numhl:           "GitSignsDeleteNr"
      linehl:          "GitSignsDeleteLn"
    changedelete:
      hl:              "GitSignsChange"
      text:            "│~"
      numhl:           "GitSignsChangeNr"
      linehl:          "GitSignsChangeLn"
  keymaps:
    -- Default keymap options
    noremap: true
    buffer: true

    ["n <leader>gn"]: { expr: true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"}
    ["n <leader>gp"]: { expr: true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"}

    ["n <leader>gs"]: "<cmd>lua require'gitsigns'.stage_hunk()<CR>"
    ["n <leader>gu"]: "<cmd>lua require'gitsigns'.undo_stage_hunk()<CR>"
    ["n <leader>gr"]: "<cmd>lua require'gitsigns'.reset_hunk()<CR>"
    ["n <leader>gR"]: "<cmd>lua require'gitsigns'.reset_buffer()<CR>"
    ["n <leader>gP"]: "<cmd>lua require'gitsigns'.preview_hunk()<CR>"
    ["n <leader>gb"]: "<cmd>lua require'gitsigns'.blame_line()<CR>"
    -- Text objects
    ["o ih"]: ":<C-U>lua require'gitsigns'.select_hunk()<CR>"
    ["x ih"]: ":<C-U>lua require'gitsigns'.select_hunk()<CR>"

setup gitsigns_setup

return

