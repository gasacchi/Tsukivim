;; Module for configure bufferline
(local {: require-plugin} (require :lib.tsukivim))

(local opts 
  {:options 
       {:numbers :ordinal
        :view :multiwindow
        :modified_icon ""
        :indicator_icon "  "
        :buffer_close_icon "﯇"
        :offsets 
          [{:filetype "NvimTree" 
            :text "File Explorer"
            :text_align "center"}]
        :diagnostics "nvim_lsp"
        :diagnostics_indicator 
        (fn [count level diag_dict ctx]
          (.. "[" count "]"))}})

(let [(ok? bufferline) (require-plugin :bufferline)]
  (when ok?
    (bufferline.setup opts)))

