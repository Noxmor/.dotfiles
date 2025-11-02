#!/usr/bin/env bash

# Copyright (c) 2025 Noxmor

set -euo pipefail

PKGS=(
    audacity
    base-devel
    bat
    blueman
    btop
    discord
    ffmpeg
    fish
    fisher
    gimp
    git
    glslang
    gnome-keyring
    hypridle
    hyprlock
    hyprpaper
    hyprshot
    jdk21-openjdk
    less
    lxappearance
    minecraft-launcher
    noto-fonts-cjk
    nvim
    obs-studio
    openssh
    p7zip
    pavucontrol
    pipewire
    pipewire-alsa
    pipewire-audio
    pipewire-jack
    pipewire-pulse
    plasma-framework5
    python-pip
    python-pipx
    spotify
    spotify-adblock
    steam
    teamspeak
    teamspeak3
    telegram-desktop
    texlive-basic
    texlive-bin
    texlive-latex
    texlive-latexextra
    texlive-latexrecommended
    thunderbird
    tmux
    torbrowser-launcher
    ttf-cascadia-code-nerd
    ttf-cascadia-mono-nerd
    ttf-hack
    unrar
    unzip
    vlc
    vlc-plugin-ffmpeg
    waybar
    wine
    wine-mono
    winetricks
    wireplumber
    wlogout
    yazi
    zathura
    zathura-pdf-mupdf
)

install_yay()
{
    echo "Checking if yay is installed..."
    if ! command -v yay &>/dev/null; then
        echo "yay not found. Installing yay..."
        sudo pacman -S --needed --noconfirm git base-devel
        tmp_dir=$(mktemp -d)
        git clone https://aur.archlinux.org/yay.git "$tmp_dir"
        pushd "$tmp_dir" >/dev/null
        makepkg -si --noconfirm
        popd >/dev/null
        echo "yay installed successfully!"
    else
        echo "yay is already installed."
    fi
}

install_packages()
{
    echo "Installing packages..."
    yay -S --needed "${PKGS[@]}"
    echo "Installation complete!"
}

main()
{
    install_yay
    install_packages
}

main
