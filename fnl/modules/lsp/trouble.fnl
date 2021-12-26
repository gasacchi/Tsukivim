;; Module for configure Trouble.nvim
(local {: require-plugin} (require :lib.tsukivim))
  
(let [(ok? trouble) (require-plugin :trouble)]
  (when ok?
    (trouble.setup))) 
