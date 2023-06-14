#!  /bin/bash
i3-msg -q "workspace 1; append_layout ~/.config/i3/workspace_1.json"

# and finally we fill the containers with the programs they had
(firefox&)
(slack&)

