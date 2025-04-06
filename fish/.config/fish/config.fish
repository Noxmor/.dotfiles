# Copyright (c) 2025 Noxmor

set -g fish_greeting ""

if status is-interactive
    theme_gruvbox dark hard
end

function fish_prompt
    set -l username (whoami)
    set -l current_dir (pwd | string replace -r "^$HOME" "~")

    set -l git_branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)

    set git_status (git status --porcelain 2>/dev/null)
    if test -n "$git_status"
        set git_symbol (set_color brred -b normal)" ✗ "
    else
        set git_symbol (set_color brgreen -b normal)" ✔ "
    end

    if test -n "$git_branch"
        echo -n (set_color cyan)""(set_color brwhite -b cyan)" $username "(set_color cyan -b blue)""(set_color brwhite -b blue)" $current_dir "(set_color blue -b brblack)""(set_color brwhite -b brblack)"  $git_branch "(set_color brblack -b normal)"""$git_symbol"(set_color normal)
    else
        echo -n (set_color cyan)""(set_color brwhite -b cyan)" $username "(set_color cyan -b blue)""(set_color brwhite -b blue)" $current_dir "(set_color blue -b normal)""(set_color bryellow -b normal)" \$ "(set_color normal)
    end
end
