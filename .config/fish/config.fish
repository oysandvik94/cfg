# source ~/.config/fish/themes/fish_tokyonight_night.theme

# Alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias fztmux='~/.local/bin/scripts/tmux-sessionizer'

# TODO: Extract RSA to env var
bash -c "eval `keychain --eval --agents ssh id_rsa id_ed25519 --quiet` > /dev/null 2>&1"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Variables
set -x PATH $PATH $HOME/.dotnet/tools
set -x DOTNET_ROOT $HOME/.dotnet
set -x PATH $PATH $DOTNET_ROOT

source ~/.config/fish/local_variables.fish
