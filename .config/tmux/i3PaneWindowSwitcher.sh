#!/bin/bash

# Get the direction from the parameter
direction=$1

# Check if the direction is valid
if [ ! -z "$direction" ]; then
    # Check if the direction is supported
    supported_directions="left right top bottom"
    case $direction in
        left)
            tmuxDirection="L"
            ;;
        right)
            tmuxDirection="R"
            ;;
        top)
            tmuxDirection="U"
            ;;
        bottom)
            tmuxDirection="D"
            ;;
        *)
            echo "Invalid direction"
            exit 1
            ;;
    esac

    # Get the pane specification for the given direction
    pane_spec=$(tmux display -p "#{pane_at_$direction}")

    # Check if the pane exists
    if [ "$pane_spec" = "1" ]; then
        i3-msg focus $direction > /dev/null
    else
        tmux select-pane -$tmuxDirection
    fi
else
    echo "Please specify a direction"
    fi
