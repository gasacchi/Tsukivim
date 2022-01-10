;; Module for configure indent_blankline
(local tsv (require :lib.tsukivim))

;; FIX: move vim lib from tsukivim
(let [(ok? indent) (tsv.require-plugin :indent_blankline)
      opt vim.opt]
  (if ok?
   (tset opt :list true)
   ; (opt.listchars:append "eol:↴")
   (indent.setup 
     {:space_char_blankline " "
      :buftype_exclude [:terminal :prompt :nofile :help]
      :filetype_exclude [:packer :alpha :TelescopePrompt :glowpreview :NvimTree]
      :show_current_context true
      :show_current_context_start true})
   :otherwise (tsv.notify.error "Cannot load indent-blankline.nvim" 
                                "Plugin: indent-blankline.nvim")))
