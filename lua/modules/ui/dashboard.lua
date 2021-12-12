local dashboard = {}

dashboard.config = function()
  vim.g.dashboard_default_executive       = "telescope"
  vim.g.dashboard_preview_command         = 'cat'
  vim.g.dashboard_preview_pipeline        = 'lolcat'
  vim.g.dashboard_preview_file            = "~/.config/nvim/assets/tsukivim.cat"
  vim.g.dashboard_preview_file_height     = 10
  vim.g.dashboard_preview_file_width      = 80
  vim.g.dashboard_custom_footer           = {"(code ∘ solve) (problems)"}
  vim.g.dashboard_custom_shortcut         = {
    last_session                          =                "SPC f l",
    find_history                          =                "SPC s h",
    find_file                             =                "SPC s f",
    new_file                              =                "SPC f n",
    change_colorscheme                    =                "SPC s ,",
    find_word                             =                "SPC s .",
    book_marks                            =                "SPC s m",
  }
end

return dashboard
