;; Module contians search command provide by telescope
(local {: cmd : notify : require-plugin : todo} (require :lib.tsukivim))

(local search-commands {})

(fn theme [title ?height] 
  "Accept title and optional height and return ivy theme table
  with additional options"
  (let [(ok? themes) (require-plugin :telescope.themes)]
    (if ok? 
      (themes.get_ivy {:layout_config {:prompt_position :bottom
                                       :height (or ?height 20)}
                       :prompt_prefix " ﬦ "
                       :prompt_title title})
      {})))

(fn picker [name ?title ?height]
  "Accept name of the telescope builtin picker and optional titile and height
  passed to theme function and return builtin picker if telescope is loaded 
  throw notification error otherwise"
  (let [(ok? builtin) (require-plugin :telescope.builtin)]
    (if ok?
      ((. builtin name) (theme (or ?title name) ?height))
      notify.error "Cannot load telescope" (.. "Search: " name))))

(fn search-commands.help-tags []
  "Open :h help tags in telescope"
  (picker :help_tags "ﬤ  Help" 15))

(fn search-commands.man-pages []
  "Open man pages in telescope"
  (picker :man_pages "  Man page" 15))

(fn search-commands.grep-string []
  "Search string under cursor"
  (picker :grep_string "  String under cursor"))

(fn search-commands.live-grep []
  "Search string in current directory"
  (picker :live_grep "  String in current directory"))

(fn search-commands.find-files []
  "Find files in current directory tree"
  (picker :find_files "  Find files in current directory"))

(fn search-commands.git-files []
  "Find files in git directory and fallback to find_files if current directory
  not a git repo"
  (let [(ok? _) (pcall picker :git_files "  Git files")]
    (if (not ok?)
      (do 
        (notify.warn "Current directory isn't git repo fallback to find-files" 
                     "Search: git-files")
        (search-commands.find-files)))))

(fn search-commands.current-buffer-fuzzy-find []
  "Fuzzy find in current buffer"
  (picker :current_buffer_fuzzy_find "  String in current buffer"))

(fn search-commands.filetypes []
  "Search filetypes and apply to current opened buffer"
  (picker :filetypes "  Filetypes" 15))

(fn search-commands.highlights []
  "Search for highlights group"
  (picker :highlights "  Highlights" 15))

(fn search-commands.command-history []
  "Search for command history"
  (picker :command_history "  Command history" 15))

(fn search-commands.search-history []
  "Search for search term '/' history"
  (picker :search_history "  Search history" 15))

(fn search-commands.autocommands []
  "Search for auto commands"
  (picker :autocommands "省 Autocommands" 15))

(fn search-commands.buffers []
  "Search for buffers"
  (picker :buffers "﬘  Buffers"))
  
(fn search-commands.commands []
  "Search available commands"
  (picker :commands "﬘  Commands" 15))

(fn search-commands.recent-files []
  "Search for recently opened files"
  (picker :oldfiles "  Recently opened files"))

(fn search-commands.keymaps []
  "Search for available keymaps"
  (picker :keymaps "  Keymaps" 15))

(fn search-commands.marks []
  "Search for available marks"
  (picker :morks "  Marks" 15))

(fn search-commands.vim-options []
  "Search for vim options and apply it"
  (picker :vim_options "  Vim options" 15))

(fn search-commands.registers []
  "Search for available registers"
  (picker :registers "  Registers" 15))

;; TODO:: 
(fn search-commands.projects []
  "Search available projects"
  ; (cmd "Telescope projects theme=ivy")
  (todo :search-commands.projects))

search-commands

