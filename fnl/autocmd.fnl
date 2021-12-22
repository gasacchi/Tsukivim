(import-macros {: run!} :lib.macro.vim)

;; (run! "augroup packer_user_config
;;        autocmd!
;;        autocmd BufWritePost plugins.fnl source <afile> | PackerCompile
;;      augroup end")

;; Map q to exit help
(run! "autocmd FileType help noremap <buffer> q :close<CR>")
;; Map q to exit Dashboard
(run! "autocmd FileType dashboard noremap <buffer> q :q<CR>")
;; for quikfix
(run! "autocmd FileType qf noremap <buffer> q :q<CR>")
