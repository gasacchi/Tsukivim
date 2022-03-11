;; Module contians gitsigns commands

(local tsv (require :utils))

(fn generate-command [sub-command]
  (let [(ok? gitsigns) (tsv.require-plugin :gitsigns)]
    (if ok?
      (match sub-command
        :next (fn [] 
                (gitsigns.next_hunk))
        :prev (fn []
                (gitsigns.prev_hunk))
        :stage (fn []
                 (gitsigns.stage_hunk))
        :stage-buffer (fn []
                        (gitsigns.stage_buffer))
        :undo-stage (fn []
                      (gitsigns.undo_stage_hunk))
        :reset (fn []
                 (gitsigns.reset_hunk))
        :preview (fn []
                   (gitsigns.preview_hunk))
        :blame (fn []
                 (gitsigns.blame_line {:full true}))
        _ (tsv.notify.error 
            "Invalid sub-command" 
            [:fn:generate-command :modules.gitsigns.commands]))
      :otherwise (tsv.notify.error 
                   gitsigns 
                   [:fn:generate-command :modules.gitsigns.commands]))))

{:next         (generate-command :next)
 :prev         (generate-command :prev)
 :stage        (generate-command :stage)
 :stage-buffer (generate-command :stage-buffer)
 :undo-stage   (generate-command :undo-stage)
 :reset        (generate-command :reset)
 :preview      (generate-command :preview)
 :blame        (generate-command :blame)}

