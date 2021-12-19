;; Module for configure indent_blankline
(import-macros {: let-global!} :lib.macro.vim)
(local {: plugin-exist?} (require :lib.tsukivim))

(fn setup []
  "Function that run after indent_blankline is loaded"
  (when (plugin-exist? :indent-blankline.nvim)
    (let [indent (require :indent_blankline)
          opt vim.opt]

      (tset opt :list true)
      (opt.listchars:append "eol:↴")
      (indent.setup 
        {:space_char_blankline " "
         :filetype_exclude [:alpha :help :packer]
         :show_current_context true
         :show_current_context_start true}))))

{: setup}
