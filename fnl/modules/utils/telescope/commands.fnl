;; Module contains telescope.nvim commands

(local tsv (require :lib.tsukivim))
(local themes (require :modules.utils.telescope.themes))

(fn picker [name ?title ?height]
  "Accept name of the telescope builtin picker and optional title and height
  passed to theme config function and return builtin picker 
  if telescope is loaded otherwise show notification with error"
  (let [(ok? builtin) (tsv.require-plugin :telescope.builtin)]
    (if ok?
      ((. builtin name) (themes.config (or ?title name) ?height))
      :otherwise (tsv.notify.error 
                   builtin 
                   "modules.utils.telescope.commands: fn picker"))))

(fn help-tags []
  "Open :h help tags in telescope"
  (picker :help_tags "ﬤ  Help" 15))

(fn man-pages []
  "Open man pages in telescope"
  (picker :man_pages "  Man page" 15))

(fn grep-string []
  "Search string under cursor"
  (picker :grep_string "  String under cursor"))

(fn live-grep []
  "Search string in current directory"
  (picker :live_grep "  String in current directory"))

(fn find-files []
  "Find files in current directory tree"
  (picker :find_files "  Find files in current directory"))

(fn git-files []
  "Find files in git directory and fallback to find_files if current directory
  not a git repo"
  (let [(ok? err) (pcall picker :git_files "  Git files")]
    (when (not ok?)
        (tsv.notify.warn err
                         "modules.utils.telescope.commands: fn git-files")
        (find-files))))

(fn current-buffer-fuzzy-find []
  "Fuzzy find in current buffer"
  (picker :current_buffer_fuzzy_find "  String in current buffer"))

(fn filetypes []
  "Search filetypes and apply to current opened buffer"
  (picker :filetypes "  Filetypes" 15))

(fn highlights []
  "Search for highlights group"
  (picker :highlights "  Highlights" 15))

(fn command-history []
  "Search for command history"
  (picker :command_history "  Command history" 15))

(fn search-history []
  "Search for search term '/' history"
  (picker :search_history "  Search history" 15))

(fn autocommands []
  "Search for auto commands"
  (picker :autocommands "省 Autocommands" 15))

(fn buffers []
  "Search for buffers"
  (picker :buffers "﬘  Buffers"))
  
(fn commands []
  "Search available commands"
  (picker :commands "﬘  Commands" 15))

(fn recent-files []
  "Search for recently opened files"
  (picker :oldfiles "  Recently opened files"))

(fn keymaps []
  "Search for available keymaps"
  (picker :keymaps "  Keymaps" 15))

(fn marks []
  "Search for available marks"
  (picker :marks "  Marks" 15))

(fn vim-options []
  "Search for vim options and apply it"
  (picker :vim_options "  Vim options" 15))

(fn registers []
  "Search for available registers"
  (picker :registers "  Registers" 15))

(fn projects []
  "Search available projects"
  (let [(ok? telescope) (tsv.require-plugin :telescope)] 
    (if ok? 
      (do 
        (tsv.load-plugin :telescope-project.nvim)
        (telescope.load_extension :project)
        (telescope.extensions.project.project (themes.config "  Projects" 15)))
      :otherwise (tsv.notify.error 
                   telescope 
                   "modules.utils.telescope.commands: fn projects"))))


{: help-tags
 : man-pages
 : grep-string
 : live-grep
 : find-files
 : git-files
 : current-buffer-fuzzy-find
 : filetypes
 : highlights
 : command-history
 : search-history
 : autocommands
 : buffers
 : commands
 : recent-files
 : keymaps
 : marks
 : vim-options
 : registers
 : projects}
 

