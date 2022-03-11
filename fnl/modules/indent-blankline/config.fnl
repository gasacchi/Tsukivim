;; Module for configure indent_blankline
(local tsv (require :utils))

;; FIX: move vim lib from tsukivim
(let [(ok? indent) (tsv.require-plugin :indent_blankline)
      opt vim.opt]
  (if ok?
    (do
     (tset opt :list true)
   ; (opt.listchars:append "eol:↴")
     (indent.setup 
       {:space_char_blankline " "
        :buftype_exclude [:terminal :prompt :nofile :help]
        :filetype_exclude [:packer 
                           :alpha 
                           :TelescopePrompt 
                           :glowpreview 
                           :NvimTree]
        :show_current_context true
        :show_current_context_start true}))
   :otherwise (tsv.notify.error indent
                                [:module :modules.indent-blankline.config])))

