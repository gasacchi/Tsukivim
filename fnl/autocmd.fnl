(local {: cmd} (require :lib.tsukivim))

; (cmd "augroup packer_user_config
;        autocmd!
;        autocmd BufWritePost plugins.fnl | Fnlfile <afile> | PackerSync
;      augroup end")
;; Keymap for spesific filetype
;; Map q to exit help
(cmd "autocmd FileType help noremap <buffer> q :close<CR>")
;; Map q to exit Dashboard
(cmd "autocmd FileType dashboard noremap <buffer> q :q<CR>")
;; for quikfix
(cmd "autocmd FileType qf noremap <buffer> q :q<CR>")
;; for startuptime
(cmd "autocmd FileType startuptime noremap <buffer> q :q<CR>")

;; Set swayconf file as swayconfig filetype
(cmd "augroup swayconf
       autocmd!
       autocmd FileType swayconf set filetype=swayconfig
      augroup END")

;; Set waybar config as jsonc filetype
(cmd "augroup waybarconf
       autocmd!
       autocmd BufNewFile,BufRead *config/waybar/config set filetype=jsonc
      augroup END")
