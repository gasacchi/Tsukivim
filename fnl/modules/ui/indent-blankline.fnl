;; Module for configure indent_blankline
(local {: require-plugin : let-global} (require :lib.tsukivim))

(let [(ok? indent) (require-plugin :indent_blankline)
      opt vim.opt]
  (when ok?
   (tset opt :list true)
   ; (opt.listchars:append "eol:↴")
   (indent.setup 
     {:space_char_blankline " "
      :buftype_exclude [:terminal :prompt :nofile :help]
      :filetype_exclude [:packer :alpha :TelescopePrompt :glowpreview :NvimTree]
      :show_current_context true
      :show_current_context_start true})))

