;; module for configure Neovim gui
(local tsv (require :lib.tsukivim))

(fn gui? []
  "Check if neovide is exist, run command an return true otherwise false"
  (if vim.g.neovide
    (do
      ; (let-global :neovide_transparency 0.5)
      (tsv.let-global :neovide_transparency 0.9)
      (tsv. cmd "set guifont=Iosevka\\ Nerd\\ Font:h9")
      true)
    :otherwise false))

{: gui?}
