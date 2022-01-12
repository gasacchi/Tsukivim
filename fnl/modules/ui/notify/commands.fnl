;; Module contains notify commands

(local tsv (require :lib.tsukivim))

(fn dismiss []
  "Dismiss all notification"
  (let [(ok? notify) (tsv.require-plugin :notify)]
    (if ok?
      (notify.dismiss)
      :otherwise (tsv.notify.error notify
                                   "modules.ui.notify.commands: fn dismiss"))))

(fn history []
  "Display notification with telescope"
  (let [(ok? telescope) (tsv.require-plugin :telescope)
        themes (require :modules.utils.telescope.themes)]
    (if ok? 
      (telescope.extensions.notify.notify 
        (themes.config "  Notification History"))
      :otherwise (tsv.notify.error telescope
                                   "modules.ui.notify.commands: fn history"))))

{: dismiss
 : history}


