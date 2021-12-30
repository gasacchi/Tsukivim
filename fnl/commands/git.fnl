;; Module contains git command
(local {: cmd} (require :lib.tsukivim))

(local git-commands {})

(fn git-commands.open-neogit []
  "Open neogit in split below mode"
  (cmd "Neogit kind=split"))

(fn git-commands.commit []
  "Commit changes with neogit"
  (cmd "Neogit commit"))

git-commands

