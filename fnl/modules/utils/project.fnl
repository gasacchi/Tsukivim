;; Module for configure project.nvim
(local {: require-plugin} (require :lib.tsukivim))

(let [(ok? project) (require-plugin :project_nvim)]
  (if ok?
    (project.setup {})))
