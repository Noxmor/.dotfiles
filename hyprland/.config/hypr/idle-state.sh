#!/usr/bin/env bash

# Copyright (c) 2026 Noxmor

# Temporarily controls whether Hypridle is allowed to suspend the system.
# The state can be toggled manually and is automatically cleared when
# genuine activity is detected after the configured grace period.

# Runtime state file used to persist the temporary "skip suspend"
# override between Hypridle's condition and activity callbacks.
STATE_FILE="${XDG_RUNTIME_DIR}/hypridle-skip-suspend"


# Ignore activity immediately after enabling the override, so an
# accidental mouse/keyboard input does not cancel it prematurely.
GRACE_PERIOD_SECONDS=30

# Notifications shown when the suspend override is enabled or disabled.
NOTIFY_TITLE="Idle Suspend"
NOTIFY_ENABLED="Suspend is disabled until you return."
NOTIFY_DISABLED="Suspend is enabled again."

case "$1" in
    toggle)
        if [[ -e "$STATE_FILE" ]]; then
            rm -f "$STATE_FILE"
            notify-send "$NOTIFY_TITLE" "$NOTIFY_DISABLED"
        else
            mkdir -p "$(dirname "$STATE_FILE")"
            date +%s > "$STATE_FILE"
            notify-send "$NOTIFY_TITLE" "$NOTIFY_ENABLED"
        fi
        ;;

    set)
    if [[ ! -e "$STATE_FILE" ]]; then
        mkdir -p "$(dirname "$STATE_FILE")"
        date +%s > "$STATE_FILE"
        notify-send "$NOTIFY_TITLE" "$NOTIFY_ENABLED"
    fi
    ;;

    check)
        # Exit 0 when suspension is allowed; exit 1 when it is inhibited.
        [[ ! -e "$STATE_FILE" ]]
        ;;

    resume)
        [[ -e "$STATE_FILE" ]] || exit 0

        enabled_at=$(<"$STATE_FILE")
        now=$(date +%s)

        # Ignore activity shortly after enabling the state.
        if (( now - enabled_at < GRACE_PERIOD_SECONDS )); then
            exit 0
        fi

        rm -f "$STATE_FILE"
        notify-send "$NOTIFY_TITLE" "$NOTIFY_DISABLED"
        ;;

    *)
        echo "Usage: $0 {toggle|set|check|resume}" >&2
        exit 1
        ;;
esac
