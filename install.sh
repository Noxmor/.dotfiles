#!/bin/bash

# Copyright (c) 2025 Noxmor

DIRNAME="$(realpath $(dirname "$0"))"

DOTFILES=(
    ".bashrc"
    ".bash_prompt"
    ".bash_aliases"
    ".config/kitty"
    ".tmux.conf"
    ".config/nvim/init.lua"
    ".config/nvim/lua/noxmor"
)

COMPLEX_DOTFILES=(
    "install_hyprland_config"
)

function ask()
{
    read -p "$1 (Y/n): " response

    if [ -z "$response" ]; then
        response_lc="y"
    else
        response_lc=$(echo "$response" | tr '[:upper:]' '[:lower:]')
    fi

    [ "$response_lc" = "y" ]
}

function install_auto()
{
    for file in ${DOTFILES[@]}; do
        dir_path="$(dirname $HOME/$file)"
        mkdir -p "$dir_path"

        if [ -L "$HOME/$file" ]; then
            rm "$HOME/$file"
        fi

        ln -sf "$DIRNAME/$file" "$HOME/$file"
        echo "Successfully installed $file"
    done
}

function install_manual()
{
    for file in ${DOTFILES[@]}; do
        if ask "Do you want to install $file?"; then
            dir_path="$(dirname $HOME/$file)"
            mkdir -p "$dir_path"

            if [ -L "$HOME/$file" ]; then
                rm "$HOME/$file"
            fi

            ln -sf "$DIRNAME/$file" "$HOME/$file"
            echo "Successfully installed $file"
        else
            echo "Skipping installation of $file..."
        fi
    done
}

function install_complex_dotfiles()
{
    for func in ${COMPLEX_DOTFILES[@]}; do
        $func
    done
}

function install_hyprland_config()
{
    if ask "Do you want to install hyprland config?"; then
        mkdir -p "$HOME/.config/hypr"
        ln -sf "$DIRNAME/.config/hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
        ln -sf "$DIRNAME/.config/hypr/themes" "$HOME/.config/hypr/themes"
        ln -sf "$HOME/.config/hypr/themes/gruvbox.conf" "$HOME/.config/hypr/theme.conf"
        echo "Successfully installed hyprland config"
    else
        echo "Skipping installation of hyprland config..."
    fi
}

function main()
{
    echo -e "----------Noxmor's dotfiles install----------\n"

    if ask "Do you want to install all dotfiles automatically?"; then
        echo "The following files will be installed:"

        for file in ${DOTFILES[@]}; do
            if [ -e "$HOME/$file" ]; then
                echo "$file (will be overwritten)"
            else
                echo "$file"
            fi
        done

        if ask "Continue?"; then
            install_auto
        else
            echo "Aborting dotfiles installation..."
        fi
    else
        install_manual
    fi

    install_complex_dotfiles
}

main
