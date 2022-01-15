;; Module contains dashboard related autocommands

(local tsv (require :lib.tsukivim))

;; type q to quit
(tsv.cmd "autocmd FileType alpha noremap <buffer> q :q<CR>")

