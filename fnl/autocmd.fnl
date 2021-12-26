(import-macros {: run!} :lib.macro.vim)

(run! "augroup packer_user_config
       autocmd!
       autocmd BufWritePost plugins.fnl Fnlsource <afile> | PackerSync
     augroup end")

;; Keymap for spesific filetype
;; Map q to exit help
(run! "autocmd FileType help noremap <buffer> q :close<CR>")
;; Map q to exit Dashboard
(run! "autocmd FileType dashboard noremap <buffer> q :q<CR>")
;; for quikfix
(run! "autocmd FileType qf noremap <buffer> q :q<CR>")
;; for startuptime
(run! "autocmd FileType startuptime noremap <buffer> q :q<CR>")
