;; Module that contains command and wrapper functions

;; Buffer related commands
(local buffer-commands {})

(fn buffer-commands.cycle-next []
  "Cycle through next buffer"
  (vim.cmd :BufferLineCycleNext))

(fn buffer-commands.cycle-prev []
  "Cycle through previous buffer"
  (vim.cmd :BufferLineCyclePrev))

(fn buffer-commands.pick-buffer []
  "Pick and go to buffer"
  (vim.cmd :BufferLinePick))

(fn buffer-commands.pick-and-close-buffer []
  "Pick and close buffer"
  (vim.cmd :BufferLinePickClose))

(fn buffer-commands.goto-buffer [number]
  "Go to buffer with given buffer number"
  (let [buffer-number-cmd (.. "BufferLineGoToBuffer " number)]
   (lambda [] 
     (vim.cmd buffer-number-cmd))))

(fn buffer-commands.delete-buffer []
  "Delete buffer without destroying window layout"
  (vim.cmd :Bdelete))

(fn buffer-commands.first-buffer []
  "Go to first buffer"
  (vim.cmd :bfirst))

(fn buffer-commands.last-buffer []
  "Go to last buffer"
  (vim.cmd :blast))

;; Editor related commands
(local editor-commands {})

(fn editor-commands.startup-time []
  "run startuptime profiling"
  (vim.cmd :StartupTime))

(fn editor-commands.no-highlight-search []
  "no highlight search"
  (vim.cmd "let @/ = ''"))

(fn editor-commands.toggle-number-line []
  "toggle number line"
  (vim.cmd "set invnumber"))

(fn editor-commands.toggle-relative-number []
  (vim.cmd "set invrelativenumber"))

(fn editor-commands.quit []
  "Quit tsukivim"
  ;; TODO: use pcall
  (vim.cmd :q))

(fn editor-commands.force-quit []
  "Force quit tsukivim"
  (vim.cmd :q!))

(fn editor-commands.save-file []
  "Save file"
  (vim.cmd :w))

(fn editor-commands.save-file-and-quit []
  "Save file and quit tsukivim"
  (vim.cmd :wq))

(fn editor-commands.toggle-nvim-tree []
  "Toggle neovim file tree"
  (vim.cmd :NvimTreeToggle))

;; Git related commands
(local git-commands {})

(fn git-commands.open-neogit []
  "Open neogit in split below mode"
  (vim.cmd "Neogit kind=split"))

(fn git-commands.commit []
  "Commit changes with neogit"
  (vim.cmd "Neogit commit"))

;; Lsp related commands
(local lsp-commands {})

(fn lsp-commands.start-server []
  "Start LSP"
  (vim.cmd :LspStart))

(fn lsp-commands.stop-server []
  "Stop LSP"
  (vim.cmd :LspStop))

(fn lsp-commands.restart-server []
  "Restart LSP"
  (vim.cmd :LspRestart))

;; Packer related commands
(local packer-commands {})

(fn packer-commands.compile []
  "Compile plugins.fnl to packer_compiled.lua"
  (vim.cmd "PackerCompile profile=true"))

(fn packer-commands.clean []
  "Clean un-used plugins in plugins.fnl"
  (vim.cmd :PackerClean))

(fn packer-commands.install []
  "Install plugin declared in plugins.fnl"
  (vim.cmd :PackerInstall))

(fn packer-commands.sync []
  "todo"
  (vim.cmd :PackerSync))

(fn packer-commands.status []
  "Show packer status"
  (vim.cmd :PackerStatus))

(fn packer-commands.update []
  "Update plugins"
  (vim.cmd :PackerUpdate))

(fn packer-commands.profile []
  (vim.cmd :PackerProfile))

;; Telescope related commands
(local telescope-commands {})

(fn telescope-commands.test []
  (let [built-in (require :telescope.builtin)]
   (built-in.man_pages {:layout_strategy :bottom_pane
                        :layout_config {:height 5 :prompt_position :bottom}})))     
   
  

(fn telescope-commands.help-tags []
  "Open :h help tags in telescope"
  (vim.cmd "Telescope help_tags theme=ivy"))

(fn telescope-commands.man-pages []
  "Open man pages in telescope"
  (vim.cmd "Telescope man_pages theme=ivy"))

(fn telescope-commands.grep-string []
  "Search string under cursor"
  (vim.cmd "Telescope grep_string theme=ivy"))

(fn telescope-commands.file-browser []
  "Open file browser in telescope"
  (vim.cmd "Telescope file_browser theme=ivy"))

(fn telescope-commands.live-grep []
  "Search string in current directory"
  (vim.cmd "Telescope live_grep theme=ivy"))

(fn telescope-commands.find-files []
  "Find files in current directory tree"
  (vim.cmd "Telescope find_files theme=ivy"))

(fn telescope-commands.git-files []
  "Find files in git directory"
  (vim.cmd "Telescope git_files theme=ivy"))

(fn telescope-commands.current-buffer-fuzzy-find []
  "Fuzzy find in current buffer"
  (vim.cmd "Telescope current_buffer_fuzzy_find theme=ivy"))

(fn telescope-commands.filetypes []
  "Search filetypes and apply to current opened buffer"
  (vim.cmd "Telescope filetypes theme=ivy"))

(fn telescope-commands.highlights []
  "Search for highlights group"
  (vim.cmd "Telescope highlights theme=ivy"))

(fn telescope-commands.command-history []
  "Search for command history"
  (vim.cmd "Telescope command_history theme=ivy"))

(fn telescope-commands.search-history []
  "Search for search term '/' history"
  (vim.cmd "Telescope search_history theme=ivy"))

(fn telescope-commands.autocommands []
  "Search for auto commands"
  (vim.cmd "Telescope autocommands theme=ivy"))

(fn telescope-commands.buffers []
  "Search for buffers"
  (vim.cmd "Telescope buffers theme=ivy"))
  
(fn telescope-commands.commands []
  "Search available commands"
  (vim.cmd "Telescope commands theme=ivy"))

(fn telescope-commands.recent-files []
  "Search for recently opened files"
  (vim.cmd "Telescope oldfiles theme=ivy"))

(fn telescope-commands.keymaps []
  "Search for available keymaps"
  (vim.cmd "Telescope keymaps theme=ivy"))

(fn telescope-commands.marks []
  "Search for available marks"
  (vim.cmd "Telescope marks theme=ivy"))

(fn telescope-commands.vim-options []
  "Search for vim options and apply it"
  (vim.cmd "Telescope vim_options theme=ivy"))

(fn telescope-commands.registers []
  "Search for available registers"
  (vim.cmd "Telescope registers theme=ivy"))

;; Window related commands
(local window-commands {})

(fn window-commands.decrease-vertical-size []
  "Decrease vertical size by 5"
  (vim.cmd "vertical resize -5"))

(fn window-commands.increase-vertical-size []
  "Increase vertical size by 5"
  (vim.cmd "vertical resize +5"))

(fn window-commands.decrease-horizontal-size []
  "Decrease horizontal sive by 5"
  (vim.cmd "resize -5"))

(fn window-commands.increase-horizontal-size []
  "Increase horizontal sive by 5"
  (vim.cmd "resize -5"))

(fn window-commands.equal-window-size []
  "Equaly resize window"
  (vim.cmd "wincmd ="))

(fn window-commands.goto-left []
  "Go to left window"
  (vim.cmd "wincmd h"))

(fn window-commands.goto-right []
  "Go to right window"
  (vim.cmd "wincmd l"))

(fn window-commands.goto-above []
  "Go to window above"
  (vim.cmd "wincmd k"))

(fn window-commands.goto-below []
  "Go to window below"
  (vim.cmd "wincmd j"))

(fn window-commands.goto-next []
  "Go to next window"
  (vim.cmd "wincmd w"))

(fn window-commands.goto-prev []
  "Go to previous window"
  (vim.cmd "wincmd p"))

(fn window-commands.horizontal-split []
  "Split window horizontaly"
  (vim.cmd :split))

(fn window-commands.vertical-split []
  "Split window verticaly"
  (vim.cmd :vsplit))

(fn window-commands.delete-current-window []
  "Delete / close current window"
  (vim.cmd :close))

(fn window-commands.delete-other-window []
  "Delete / close other window"
  (vim.cmd :only))

(fn window-commands.rotate-window-rightwards []
  "Rotate window downwards or rightwards"
  (vim.cmd "wincmd r"))

(fn window-commands.rotate-window-leftwards []
  "Rotate window upwards or leftwards"
  (vim.cmd "wincmd R"))

(fn window-commands.exchange []
  "Exchange window with next window, if there is no next window,
  exchange with previous window"
  (vim.cmd "wincmd x"))
  


{:buffer buffer-commands
 :editor editor-commands
 :git git-commands
 :lsp lsp-commands
 :packer packer-commands
 :telescope telescope-commands
 :window window-commands}
