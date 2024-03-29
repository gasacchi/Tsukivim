;; Module contains notify commands

(local tsv (require :utils))

(fn dismiss []
  "Dismiss all notification"
  (let [(ok? notify) (tsv.require-plugin :notify)]
    (if ok?
      (notify.dismiss)
      :otherwise (tsv.notify.error notify
                                   [:fn:dismiss :modules.notify.commands]))))

(fn history []
  "Display notification with telescope"
  (let [(ok? telescope) (tsv.require-plugin :telescope)
        themes (require :modules.telescope.themes)]
    (if ok? 
      (telescope.extensions.notify.notify 
        (themes.config "  Notification History"))
      :otherwise (tsv.notify.error telescope
                                   [:fn:history :modules.notify.commands]))))

{: dismiss
 : history}

