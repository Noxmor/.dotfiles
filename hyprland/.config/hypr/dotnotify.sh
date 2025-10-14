#!/bin/bash

# Copyright (c) 2025 Noxmor

REPO="$HOME/.dotfiles"
ICON=$(realpath dotnotify.svg)

# Make sure it's a git repo
if [ ! -d "$REPO/.git" ]; then
    exit 0
fi

cd "$REPO" || exit 0

# Get the upstream branch for the current branch
upstream=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null) || exit 0

remote_branch="${upstream#*/}"

# Query the remote hash (read-only)
remote_hash=$(git ls-remote origin "$remote_branch" 2>/dev/null | awk '{print $1}')
local_hash=$(git rev-parse HEAD 2>/dev/null)

# If offline or remote not reachable, exit silently
[ -z "$remote_hash" ] && exit 0

# If up to date, exit silently
[ "$local_hash" = "$remote_hash" ] && exit 0

# Determine how many commits are behind (no fetch needed)
count=$(git rev-list --count "${local_hash}..${remote_hash}" 2>/dev/null)

# Fallback if rev-list fails for some reason
[ -z "$count" ] && count="some"

# Send notification
notify-send -i "$ICON" "Dotfiles update available" "There are ${count} new commit(s) to pull from origin/${remote_branch}."
