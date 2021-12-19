;; Module for configure bufferline
(local {: plugin-exist?} (require :lib.tsukivim))

(fn config []
  "Function that run after bufferline is loaded"
  (when (plugin-exist? :bufferline.nvim)
    (let [bufferline (require :bufferline)]
      (bufferline.setup 
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
            (.. "[" count "]"))}}))))

{: config}
