#!/bin/bash

# Copyright (c) 2025 Noxmor

REPO="$HOME/.dotfiles"
ICON=$(realpath dotnotify.svg)

# Make sure it's a git repo
if [ ! -d "$REPO/.git" ]; then
    exit 1
fi

cd "$REPO" || exit 1

# Retrieve the current branch name
branch=$(git symbolic-ref --short HEAD 2>/dev/null)

# Fetch updates for the current branch
git fetch origin "$branch" --quiet || exit 1

# Determine how many commits are behind
count=$(git rev-list --count "$branch..origin/$branch" 2>/dev/null)

# If up to date, exit silently
[ "$count" -eq 0 ] && exit 0

# Fallback if rev-list fails for some reason
[ -z "$count" ] && count="some"

# Send notification
if [ "$count" -eq 1 ]; then
    notify-send -i "$ICON" "Dotfiles update available" "There is ${count} new commit to pull from origin/${branch}."
else
    notify-send -i "$ICON" "Dotfiles update available" "There are ${count} new commits to pull from origin/${branch}."
fi
