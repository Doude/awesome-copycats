local lain  = require("lain")
local naughty = require("naughty")

local markup = lain.util.markup

local debug = {}

function debug.client_info(c)
    local v = ""

    -- object
    local c = c or client.focus
    
    local inf = {
        "name", "icon_name", "type", "class", "role", "instance", "pid",
        "skip_taskbar", "id", "group_window", "leader_id", "machine",
        "screen", "hidden", "minimized", "size_hints_honor", "titlebar",
        "urgent", "focus", "opacity", "ontop", "above", "below", "fullscreen",
        "transient_for", "maximixed_horizontal", "maximixed_vertical", "sticky",
        "modal", "focusable"
    }

    for i = 1, #inf do
        v = v .. string.format("%2s: %-20s = %s\n", i, inf[i], tostring(c[inf[i]]))
    end

    -- geometry
    local cc = c:geometry()
    local signx = (cc.x > 0 and "+") or ""
    local signy = (cc.y > 0 and "+") or ""
    local position = "@ " .. cc.width .. 'x' .. cc.height .. signx .. cc.x .. signy .. cc.y .. "\n\n"
    v = v .. string.format("%2s: %-20s = %s\n", #inf + 1, "position", position)
                           
    naughty.notify{
        title = "Client Informations:\n",
        font = "Monospace 8",
        text = v,
        timeout = 0,
        screen = c.screen
    }
end

return debug
