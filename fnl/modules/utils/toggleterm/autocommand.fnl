;; Autocommands for toggleterm

(local tsv (require :lib.tsukivim))

(tsv.cmd 
  "autocmd! TermOpen term://* lua require'modules.util.toggleterm.keymaps'.terminal-keys()")

