(local tsv (require :lib.tsukivim))

;; Keymap for spesific filetype
;; Map q to exit help
(tsv.cmd "autocmd FileType help noremap <buffer> q :close<CR>")
;; for quikfix
(tsv.cmd "autocmd FileType qf noremap <buffer> q :q<CR>")
;; for lspinfo
(tsv.cmd "autocmd FileType lspinfo noremap <buffer> q :q<CR>")

;; Set swayconf file as swayconfig filetype
(tsv.cmd "augroup swayconf
           autocmd!
           autocmd FileType swayconf set filetype=swayconfig
          augroup END")

;; Set waybar config as jsonc filetype
(tsv.cmd "augroup waybarconf
           autocmd!
           autocmd BufNewFile,BufRead *config/waybar/config set filetype=jsonc
          augroup END")

(tsv.cmd "augroup glimpse
            autocmd!
            autocmd FileType glimps set filetype=fennel
          augroup END")
