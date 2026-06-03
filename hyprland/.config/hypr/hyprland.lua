-- Copyright (c) 2025 Noxmor

--------------------
---- COLORTHEME ----
--------------------

local colorscheme = require("themes.gruvbox")

--------------------------
---- CUSTOM VARIABLES ----
--------------------------

local terminal = "kitty"
local file_manager = terminal .. " -e yazi"
local menu = "wofi --show drun"
local browser = "firefox"

------------------
---- MONITORS ----
------------------

hl.monitor({
    output = "",
    mode = "highres@highrr",
    position = "0x0",
    scale = "1"
})

hl.monitor({
    output = "DP-2",
    mode = "highres@highrr",
    position = "0x0",
    scale = "1"
})

hl.monitor({
    output = "DP-1",
    mode = "highres@highrr",
    position = "2560x0",
    scale = "1"
})

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("wljoywake")
    hl.exec_cmd("~/.config/hypr/dotnotify.sh")

    -- Set primary monitor for X11
    hl.exec_cmd("xrandr --output DP-2 --primary")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        border_size = 2,

        col = {
            inactive_border = colorscheme.col.inactive_border,
            active_border = colorscheme.col.active_border
        }
    },

    decoration = {
        rounding = 10,

        dim_inactive = true,
        dim_strength = 0.2,

        blur = {
            enabled = false
        },

        shadow = {
            enabled = false
        }
    },

    dwindle = {
        preserve_split = true
    },

    master = {
        new_status = "master"
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0
    }
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } }})

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "myBezier", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "myBezier" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "myBezier" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "myBezier" })

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "de",
        accel_profile = "flat"
    }
})

---------------------
---- KEYBINDINGS ----
---------------------

local main_mod = "SUPER"
local shft_mod = main_mod .. " + SHIFT"

hl.bind(main_mod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(main_mod .. " + C", hl.dsp.window.close())
hl.bind(main_mod .. " + M", hl.dsp.exec_cmd("uwsm stop"))
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd(file_manager))
hl.bind(main_mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(main_mod .. " + P", hl.dsp.window.pseudo())
hl.bind(main_mod .. " + T", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(main_mod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind(shft_mod .. " + F", hl.dsp.exec_cmd("torbrowser-launcher"))
hl.bind(main_mod .. " + D", hl.dsp.exec_cmd("discord"))
hl.bind(main_mod .. " + S", hl.dsp.exec_cmd("spotify"))
hl.bind(main_mod .. " + TAB", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(shft_mod .. " + TAB", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(main_mod .. " + RETURN", hl.dsp.exec_cmd(menu))
hl.bind(main_mod .. " + ESCAPE", hl.dsp.exec_cmd("hyprlock"))
hl.bind(shft_mod .. " + ESCAPE", hl.dsp.exec_cmd("wlogout"))

-- Screenshots
hl.bind(main_mod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -s -m window")) -- Window
hl.bind("PRINT",                hl.dsp.exec_cmd("hyprshot -s -m output")) -- Monitor
hl.bind(shft_mod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -s -m region")) -- Region

-- Vim-like window focus navigation
hl.bind(main_mod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(main_mod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(main_mod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(main_mod .. " + L", hl.dsp.focus({ direction = "r" }))

-- Vim-like workspace navigation
hl.bind(shft_mod .. " + H", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(shft_mod .. " + H", hl.dsp.focus({ workspace = "e+1" }))

for i = 1, 10 do
    local key = i % 10

    -- Switch workspaces with main_mod + [0-9]
    hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i}))

    -- Move active window to a workspace with shft_mod + [0-9]
    hl.bind(shft_mod .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(main_mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(shft_mod .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with main_mod + scroll
hl.bind(main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with main_mod + LMB/RMB and dragging
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Toggle MPD playback
hl.bind(main_mod .. " + Space", hl.dsp.exec_cmd("mpc toggle"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Assign workspaces to monitors
local workspaces_to_monitors = {
    { workspace =  "1", monitor = "DP-2" },
    { workspace =  "2", monitor = "DP-2" },
    { workspace =  "3", monitor = "DP-1" },
    { workspace =  "4", monitor = "DP-2" },
    { workspace =  "5", monitor = "DP-2" },
    { workspace =  "6", monitor = "DP-2" },
    { workspace =  "7", monitor = "DP-2" },
    { workspace =  "8", monitor = "DP-2" },
    { workspace =  "9", monitor = "DP-2" },
    { workspace = "10", monitor = "DP-2" }
}

for _, item in ipairs(workspaces_to_monitors) do
    hl.workspace_rule({ workspace = item.workspace, monitor = item.monitor })
end

-- Default workspace
hl.window_rule({ match = { class = ".*" }, workspace = "6" })

-- Open modal and floating windows on active workspace
hl.window_rule({ match = { modal = true, float = true }, workspace = "active" })

-- Default workspace for certain applications
hl.window_rule({ match = { class = terminal },           workspace = 1 })
hl.window_rule({ match = { class = browser },            workspace = 2 })
hl.window_rule({ match = { class = "Tor Browser" },      workspace = 2 })
hl.window_rule({ match = { class = "thunderbird" },      workspace = 2 })
hl.window_rule({ match = { class = "discord" },          workspace = 3 })
hl.window_rule({ match = { class = "TeamSpeak 3" },      workspace = 3 })
hl.window_rule({ match = { class = "teamspeak-client" }, workspace = 3 })
hl.window_rule({ match = { class = "Spotify" },          workspace = 4 })
hl.window_rule({ match = { class = "steam" },            workspace = 5 })
hl.window_rule({ match = { class = "heroic" },           workspace = 5 })

-- Open hyprland-share-picker on active workspace
hl.window_rule({ match = { class = "hyprland-share-picker" }, workspace = "active" })

-- Discord window rules
hl.window_rule({ match = { class = "discord" }, opacity = 0.9 })

-- TeamSpeak window rules
hl.window_rule({ match = { class = "TeamSpeak 3" },      opacity = 0.9 })
hl.window_rule({ match = { class = "teamspeak-client" }, opacity = 0.9 })

-- Spotify window rules
hl.window_rule({ match = { class = "Spotify" }, opacity = 0.8 })

-- Steam window rules
hl.window_rule({ match = { class = "steam" }, opacity = 0.8 })

-- Heroic Games Launcher window rules
hl.window_rule({ match = { class = "heroic" }, opacity = 0.8 })

-- Ensure floating windows spawn centered on the active monitor
hl.window_rule({ match = { float = true, modal = false }, center = true })

-- Ignore maximizing requests from apps
hl.window_rule({ match = { class = "." }, suppress_event = "maximize" })

-- Fix some dragging issues with XWayland
hl.window_rule({
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false
    },

    no_focus = true
})

-- Fix 1px black border around hyprshot screenshots
hl.layer_rule({ match = { namespace = "selection" }, no_anim = true })
