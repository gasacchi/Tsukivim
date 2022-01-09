;; Module for configure bufferline

(local tsv (require :lib.tsukivim))

(local options 
   {:numbers :ordinal
    :close_command "Bdelete %d"
    :separator_style :padded_slant
    :offsets 
      [{:filetype "NvimTree" 
        :text "File Explorer"
        :text_align "center"}]
    :diagnostics "nvim_lsp"
    :diagnostics_indicator 
    (fn [count level diag_dict ctx]
      (.. "[" count "]"))})

(let [(ok? bufferline) (tsv.require-plugin :bufferline)]
  (if ok?
    (bufferline.setup {: options})
    :otherwise (tsv.notify.error "Cannot load bufferline.nvim"
                                 "Plugin: bufferline.nvim")))

