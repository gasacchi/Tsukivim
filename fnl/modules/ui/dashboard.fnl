;; Module for configure dashboard
(local {: require-plugin} (require :lib.tsukivim))

(fn get-total-plugins []
  (var total 0)
  (each [_ _ (pairs packer_plugins)]
    (set total (+ total 1)))
  total)

(fn get-plugin-status []
  (let [status {:total 0 :loaded 0}]
    (each [_ p (pairs packer_plugins)]
      (if (= p.loaded true)
        (do 
          (tset status :total (+ status.total 1))
          (tset status :loaded (+ status.loaded 1)))
        (tset status :total (+ status.total 1))))
    status))

; (fn get-startup-time []
;  (let [f (io.open "rg 'NVIM STARTED' /tmp/nvim-startuptime | tail -1")
;        time (f:read "*a")]
;    (f:close)
;    (time:match "([%d.]+)  [%d.]+: [-]+ NVIM STARTED [-]+"))) ;"(%d+.%d+)")))

(fn get-startup-time []
  (let [file-path (.. (vim.fn.stdpath "config") "/startuptime.log")
        pattern "([%d.]+)  [%d.]+: [-]+ NVIM STARTED [-]+"
        file (io.open file-path)
        file (file:read "*all")
        time (file:match pattern)]
    (: (io.open file-path "w") :close)
    time))


(local header 
  ["⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣠⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⠿⠛⠋⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⠭⠛⣻⠿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
   "⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠰⠀⡀⠀⠀⠀⠀⠀⢀⠀⣖⠀⠀⠂⠉⠉⠁⢀⡉⠛⢿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀"
   "⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⢀⠉⠀⠀⠀⠀⠀⠀⡸⠊⠁⡀⠄⠐⠒⠂⠀⠛⠀⠀⠀⠈⠛⢿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀"
   "⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠉⣅⡠⠃⠀⠀⠀⠀⡠⣐⠒⠠⠜⠀⠀⢠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀"
   "⠀⠀⠀⠀⢠⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣃⡠⠞⠂⠀⠀⣠⠖⠈⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⢀⣀⣀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⡄⠀⠀⠀⠀"
   "⠀⠀⠀⠀⢸⣿⣿⣿⡟⠀⠀⠀⠀⣄⠀⠀⠀⡠⠊⢀⣴⣏⣡⣀⣠⣴⠒⠚⠓⢢⣀⣴⠯⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⡀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⡇⠀⠀⠀⠀"
   "⠀⠀⠀⠀⢸⣿⣿⣿⠃⣀⡤⠤⠶⢟⠒⠒⢊⣠⣾⣟⡡⠀⠀⣀⣠⠼⠛⠒⠒⢧⡀⠑⢤⡁⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⡇⠀⠀⠀⠀"
   "⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⡿⠿⡿⡿⠿⠿⠟⠛⠛⠛⠛⠛⠛⠛⠻⡀⠀⠀⠀⠀⢈⣹⡶⠾⢄⡀⠀⠀⢀⣀⡬⠿⢿⡿⠿⢶⠦⠶⢦⠬⢉⡀⢹⣿⣿⠃⠀⠀⠀⠀"
   "⠀⠀⠀⠀⠀⠹⣿⣿⣇⠈⠉⠑⠒⠚⡆⠤⠤⣤⠤⠀⠄⠀⠀⠀⠀⠉⠢⡀⣀⡀⠀⠀⠁⠀⠀⠈⠫⡍⠉⠀⠀⠀⢼⢤⡄⠀⠳⢄⠀⠀⠀⠓⣿⣿⠏⠀⠀⠀⠀⠀"
   "⠀⠀⠀⠀⠀⠀⠹⣿⣿⡄⠀⠀⠀⠀⠈⠉⠐⠊⠉⠉⠀⠀⠀⠀⠀⠀⠀⠈⠀⠈⠒⠤⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠂⢱⠀⠀⣼⣿⠏⠳⠄⠀⠀⠀⠀"
   "⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣤⠀⠀⠀⠘⠉⣑⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⢑⣾⠟⠁⠀⠀⠀⠀⠀⠀⠀"
   "⠀⠀⠀⠀⠀⠀⠀⠀⣶⣾⣿⣷⣦⡶⠄⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣯⠀⠀⠀⠀⠈⠃⠀⠀⠀⠀⠀⠀⠀⠈⠃⠀⠀⠀⣀⣀⡴⠟⢁⡀⠀⠀⠀⠀⠀⠀⠀⠀"
   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡇⠉⠛⣾⣟⡉⠛⠀⠀⢸⡇⠀⠀⢸⡇⢸⣿⢀⣼⠎⠀⢸⡇⠀⣴⠀⠀⢀⣤⠂⢸⡇⠀⣾⣾⠟⢻⣇⣴⠛⢻⡆⠀⠀⠀⠀⠀⠀⠀"
   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣇⠀⠀⠈⠛⠛⠛⣷⡄⣸⡇⠀⠀⣿⠁⢨⡟⠻⣧⡀⠀⣼⠃⠀⢹⣇⢠⡟⠁⠀⣼⠗⠈⣿⡏⠀⠀⣿⡏⠀⠘⣷⠀⠀⠀⠀⠀⠀⠀"
   "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⠀⠀⠘⠷⣦⣴⠟⠁⠈⠻⠷⠾⠃⠀⠸⠇⠀⠈⢷⠀⠛⠀⠀⠀⢿⠟⠁⠀⠀⠛⠀⠀⠿⠇⠀⠀⠿⠃⠀⠀⠇⠀⠀⠀⠀   "])

(let [(ok? alpha) (require-plugin :alpha)]
  (when ok?
    (let [dashboard (require :alpha.themes.dashboard)
          section dashboard.section
          button (fn [shortcut txt keybind keybind-opts]
                   (let [b (dashboard.button shortcut txt keybind keybind-opts)]
                     (tset b.opts :hl :Function)
                     (tset b.opts :hl_shortcut :String)
                     b))
          {: total : loaded} (get-plugin-status)
          time (get-startup-time)]
      (tset section.header :val header)
      (tset section.header.opts :hl :Boolean)
      (tset section.buttons :val
            [(button "SPC s f"  "  Search files") 
             (button "SPC s h"  "ﭯ  Recently opened files")
             (button "SPC q"    "  Quit tsukivim")])
      (tset section.footer :val (.. "Tsukivim loaded " 
                                    loaded
                                    " of "
                                    total
                                    " plugins in "
                                    time " ms"))
      (tset section.footer.opts :hl :Statement)
      (alpha.setup dashboard.opts))))

