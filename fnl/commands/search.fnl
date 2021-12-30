;; Module contians search command provide by telescope
(local {: cmd} (require :lib.tsukivim))

(local telescope-commands {})

(fn telescope-commands.test []
  (let [built-in (require :telescope.builtin)]
   (built-in.man_pages {:layout_strategy :bottom_pane
                        :layout_config {:height 5 :prompt_position :bottom}})))     

(fn telescope-commands.help-tags []
  "Open :h help tags in telescope"
  (cmd "Telescope help_tags theme=ivy"))

(fn telescope-commands.man-pages []
  "Open man pages in telescope"
  (cmd "Telescope man_pages theme=ivy"))

(fn telescope-commands.grep-string []
  "Search string under cursor"
  (cmd "Telescope grep_string theme=ivy"))

(fn telescope-commands.file-browser []
  "Open file browser in telescope"
  (cmd "Telescope file_browser theme=ivy"))

(fn telescope-commands.live-grep []
  "Search string in current directory"
  (cmd "Telescope live_grep theme=ivy"))

(fn telescope-commands.find-files []
  "Find files in current directory tree"
  (cmd "Telescope find_files theme=ivy"))

(fn telescope-commands.git-files []
  "Find files in git directory and fallback to find_files if current directory
  not a git repo"
  (let [(ok? _) (pcall cmd "Telescope git_files theme=ivy")]
    (if (not ok?)
      (telescope-commands.find-files))))

(fn telescope-commands.current-buffer-fuzzy-find []
  "Fuzzy find in current buffer"
  (cmd "Telescope current_buffer_fuzzy_find theme=ivy"))

(fn telescope-commands.filetypes []
  "Search filetypes and apply to current opened buffer"
  (cmd "Telescope filetypes theme=ivy"))

(fn telescope-commands.highlights []
  "Search for highlights group"
  (cmd "Telescope highlights theme=ivy"))

(fn telescope-commands.command-history []
  "Search for command history"
  (cmd "Telescope command_history theme=ivy"))

(fn telescope-commands.search-history []
  "Search for search term '/' history"
  (cmd "Telescope search_history theme=ivy"))

(fn telescope-commands.autocommands []
  "Search for auto commands"
  (cmd "Telescope autocommands theme=ivy"))

(fn telescope-commands.buffers []
  "Search for buffers"
  (cmd "Telescope buffers theme=ivy"))
  
(fn telescope-commands.commands []
  "Search available commands"
  (cmd "Telescope commands theme=ivy"))

(fn telescope-commands.recent-files []
  "Search for recently opened files"
  (cmd "Telescope oldfiles theme=ivy"))

(fn telescope-commands.keymaps []
  "Search for available keymaps"
  (cmd "Telescope keymaps theme=ivy"))

(fn telescope-commands.marks []
  "Search for available marks"
  (cmd "Telescope marks theme=ivy"))

(fn telescope-commands.vim-options []
  "Search for vim options and apply it"
  (cmd "Telescope vim_options theme=ivy"))

(fn telescope-commands.registers []
  "Search for available registers"
  (cmd "Telescope registers theme=ivy"))

telescope-commands

