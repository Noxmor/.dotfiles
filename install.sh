#!/bin/bash

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

DOTFILES=(".bashrc" ".bash_prompt" ".bash_aliases")

function install_auto()
{
    for file in ${DOTFILES[@]}; do
        ln -sf "$DIRNAME/$file" "$HOME/$file"
        echo "Successfully installed $file"
    done
}

function install_manual()
{
    for file in ${DOTFILES[@]}; do
        if ask "Do you want to install $file?"; then
            ln -sf "$DIRNAME/$file" "$HOME/$file"
            echo "Successfully installed $file"
        else
            echo "Skipping installation of $file..."
        fi
    done
}

echo -e "----------Noxmor's dotfiles install----------\n"

DIRNAME="$(realpath $(dirname "$0"))"

if ask "Do you want to install all dotfiles automatically?"; then
    echo "The following files will be installed:"

    for file in ${DOTFILES[@]}; do
        if [ -f "$HOME/$file" ]; then
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
