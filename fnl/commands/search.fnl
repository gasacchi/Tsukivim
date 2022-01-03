;; Module contians search command provide by telescope
(local {: cmd : notify} (require :lib.tsukivim))

(local search-commands {})

(fn search-commands.test []
  (let [built-in (require :telescope.builtin)]
   (built-in.man_pages {:layout_strategy :bottom_pane
                        :layout_config {:height 5 :prompt_position :bottom}})))     

(fn search-commands.help-tags []
  "Open :h help tags in telescope"
  (cmd "Telescope help_tags theme=ivy"))

(fn search-commands.man-pages []
  "Open man pages in telescope"
  (cmd "Telescope man_pages theme=ivy"))

(fn search-commands.grep-string []
  "Search string under cursor"
  (cmd "Telescope grep_string theme=ivy"))

(fn search-commands.file-browser []
  "Open file browser in telescope"
  (cmd "Telescope file_browser theme=ivy"))

(fn search-commands.live-grep []
  "Search string in current directory"
  (cmd "Telescope live_grep theme=ivy"))

(fn search-commands.find-files []
  "Find files in current directory tree"
  (cmd "Telescope find_files theme=ivy"))

(fn search-commands.git-files []
  "Find files in git directory and fallback to find_files if current directory
  not a git repo"
  (let [(ok? _) (pcall cmd "Telescope git_files theme=ivy")]
    (if (not ok?)
      (do 
        (notify.warn "Current directory isn't git repo fallback to find-files" 
                     "Search: git-files")
        (search-commands.find-files)))))

(fn search-commands.current-buffer-fuzzy-find []
  "Fuzzy find in current buffer"
  (cmd "Telescope current_buffer_fuzzy_find theme=ivy"))

(fn search-commands.filetypes []
  "Search filetypes and apply to current opened buffer"
  (cmd "Telescope filetypes theme=ivy"))

(fn search-commands.highlights []
  "Search for highlights group"
  (cmd "Telescope highlights theme=ivy"))

(fn search-commands.command-history []
  "Search for command history"
  (cmd "Telescope command_history theme=ivy"))

(fn search-commands.search-history []
  "Search for search term '/' history"
  (cmd "Telescope search_history theme=ivy"))

(fn search-commands.autocommands []
  "Search for auto commands"
  (cmd "Telescope autocommands theme=ivy"))

(fn search-commands.buffers []
  "Search for buffers"
  (cmd "Telescope buffers theme=ivy"))
  
(fn search-commands.commands []
  "Search available commands"
  (cmd "Telescope commands theme=ivy"))

(fn search-commands.recent-files []
  "Search for recently opened files"
  (cmd "Telescope oldfiles theme=ivy"))

(fn search-commands.keymaps []
  "Search for available keymaps"
  (cmd "Telescope keymaps theme=ivy"))

(fn search-commands.marks []
  "Search for available marks"
  (cmd "Telescope marks theme=ivy"))

(fn search-commands.vim-options []
  "Search for vim options and apply it"
  (cmd "Telescope vim_options theme=ivy"))

(fn search-commands.registers []
  "Search for available registers"
  (cmd "Telescope registers theme=ivy"))

(fn search-commands.projects []
  "Search available projects"
  (cmd "Telescope projects theme=ivy"))

search-commands

