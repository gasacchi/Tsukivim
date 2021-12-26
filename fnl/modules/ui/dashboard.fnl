;; Module for configure dashboard
(local {: require-plugin} (require :lib.tsukivim))


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
          button dashboard.button]
      (tset section.header :val header)
      (tset section.header.opts :hl :Boolean)
      (tset section.buttons :val 
            [(button "SPC s f"  "  Search files")
             (button "SPC s h"  "ﭯ  Recently opened files")
             (button "SPC q"    "  Quit tsukivim")])
      (tset section.buttons.opts :hl :Boolean)
      (tset section.buttons.opts :hl_shortcut :Boolean)
      (tset section.footer :val ["Hello"])
      (alpha.setup dashboard.opts))))

