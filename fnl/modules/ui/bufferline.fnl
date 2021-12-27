;; Module for configure bufferline
(local {: require-plugin} (require :lib.tsukivim))

(local options 
   {:numbers :ordinal
    :close_command "Bdelete %d"
    ; :modified_icon ""
    ; :indicator_icon "  "
    ; :buffer_close_icon "﯇"
    :separator_style :padded_slant
    :offsets 
      [{:filetype "NvimTree" 
        :text "File Explorer"
        :text_align "center"}]
    :diagnostics "nvim_lsp"
    :diagnostics_indicator 
    (fn [count level diag_dict ctx]
      (.. "[" count "]"))})

(let [(ok? bufferline) (require-plugin :bufferline)]
  (when ok?
    (bufferline.setup {: options})))


