#!/bin/bash

read -r prev_state < /proc/acpi/button/lid/LID0/state
prev_state="${prev_state##*[[:space:]]}"
while sleep 2; do
    read -r state < /proc/acpi/button/lid/LID0/state

    # Remove leading and trailing spaces from the state
    state="${state##*[[:space:]]}"

    if [[ "$state" != "$prev_state" ]]; then
        # State has changed
        prev_state="$state"

        bspc wm -r
    fi
done

