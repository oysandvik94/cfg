# Alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias fztmux='~/.local/bin/scripts/tmux-sessionizer'
alias w3m='w3m -config ~/.config/w3m/config'

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Variables
set -x PATH $PATH $HOME/.dotnet/tools
set -x DOTNET_ROOT $HOME/.dotnet
set -x PATH $PATH $DOTNET_ROOT
set -x W3M_DIR "~/.local/state/w3m"

fish_add_path $HOME/.local/bin/scripts/

set -g fish_greeting

