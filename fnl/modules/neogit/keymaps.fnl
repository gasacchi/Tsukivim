;; Module contains neogit keymaps

(local neogit-cmd (require :modules.neogit.commands))

{:normal {:g [neogit-cmd.open      :Open-neogit]
          :c [neogit-cmd.commit    :Open-neogit-commit]}}

