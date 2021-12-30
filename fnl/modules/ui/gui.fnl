;; module for configure Neovim gui
(local 
  {: cmd : let-global} (require :lib.tsukivim))

(fn gui? []
  "Check if neovide is exist, run command an return true otherwise false"
  (if vim.g.neovide
    (do
      (let-global :neovide_transparency 0.5)
      (cmd "set guifont=Iosevka\\ Nerd\\ Font:h9")
      true)
    false))

{: gui?}
