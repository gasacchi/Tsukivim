;; Module for configure indent_blankline
(local {: require-plugin} (require :lib.tsukivim))

(let [(ok? indent) (require-plugin :indent_blankline)
      opt vim.opt]
  (when ok?
   (tset opt :list true)
   (opt.listchars:append "eol:↴")
   (indent.setup 
     {:space_char_blankline " "
      :filetype_exclude [:alpha :help :packer :whichkey] 
      :show_current_context true
      :show_current_context_start true})))

