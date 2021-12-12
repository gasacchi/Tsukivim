local notify = require'notify'
local M = {}

notify.setup({
      stages = "fade_in_slide_out",
      render = render or "default",
      background_colour = "#0a1719",
})


function M.info(message, info)
      notify(message, "info", {
            title = info or "Tsukivim Action",
            timeout = 200,
            icon = ""
      })
end

function M.warn(message, warn)
      notify(message, "warn", {
            title = warn,
            timeout = 3000,
      })
end

function M.error(message, error)
      notify(message, "error", {
            title = error,
            timeout = 5000,
      })
end

function M.debug(message, debug)
      notify(message, "error", {
            title = debug,
            timeout = 5000,
      })
end

return M
