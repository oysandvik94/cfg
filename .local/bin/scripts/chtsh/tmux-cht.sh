#!/usr/bin/env bash
selected=`cat ~/.local/bin/scripts/chtsh/.tmux-cht-languages ~/.local/bin/scripts/chtsh/.tmux-cht-custom ~/.local/bin/scripts/chtsh/.tmux-cht-command | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.local/bin/scripts/chtsh/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "curl -s cht.sh/$selected/$query | less -R"
elif [[ $selected == 'wiki' ]]; then
   tmux neww bash -c "less -i -p \"$query\" ~/wiki/vim.md" 
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less -R"
fi
