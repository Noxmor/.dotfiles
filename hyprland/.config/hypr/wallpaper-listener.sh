#!/bin/sh

# Copyright (c) 2025 Noxmor

current_workspace="1"

handle() {
    case $1 in
        workspace\>\>*)
            if echo "$1" | grep -q '1'; then
                hyprctl hyprpaper wallpaper "eDP-1,~/.config/wallpapers/anime_skull.png"
            elif [ "$current_workspace" = "1" ]; then
                hyprctl hyprpaper wallpaper "eDP-1,~/.config/wallpapers/astronaut.png"
            fi
            current_workspace=$(echo "$1" | grep -oP '\d+')
        ;;
    esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
