;; Module for toggleterm keymaps
(local tsv (require :lib.tsukivim))

(fn terminal-keys []
  (let [opts {:noremap true}]
   (do
    tsv.set-buffer-keymaps 0 :t :<esc> "<C-\\><C-n>" opts)))

{: terminal-keys}
    
