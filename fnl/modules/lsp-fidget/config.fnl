;; Module for configure fidget
(local tsv (require :utils))

(let [(ok? fidget) (tsv.require-plugin :fidget)]
  (if ok?
    (do
      (fidget.setup 
        {:text {:spinner :zip}
         :window {:blend 0}})
      (tsv.cmd "hi! FidgetTitle guibg=NONE guifg=#C34043 gui=bold") 
      (tsv.cmd "hi! FidgetTask guibg=NONE guifg=#76946A")) 
    :otherwise (tsv.notify.error fidget
                                 [:module :modules.lsp-fidget.config])))

