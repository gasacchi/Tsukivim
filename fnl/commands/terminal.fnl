;; Module contains terminal integrations

(local {: cmd} (require :lib.tsukivim))

(local terminal-commands {})

(fn terminal-commands.toggle-term []
  "Toggle terminal"
  (cmd "ToggleTerm dir=git_dir"))

(fn terminal-commands.toggle-all-term []
  "Toggle all currenly opened terminal"
  (cmd "ToggleTermToggleAll"))

terminal-commands
