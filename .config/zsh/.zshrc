#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


source $ZDOTDIR/plugins.zsh
source $ZDOTDIR/aliases
source $ZDOTDIR/vim.zsh


path+=("$HOME/.local/bin/scripts")
path+=("$HOME/.local/share/nvim/mason/bin")

# Completion
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
source $ZDOTDIR/completion.zsh

source $ZDOTDIR/ssh-agent.zsh


# Directory stack
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index;

dotc() {
    if [ $# -eq 3 ]; then
    dotfiles commit -m "$1($2): $3"
    else
        echo "You shall not pass! The function requires exactly three parameters."
    fi
}

gcb() {
    if [ $# -eq 0 ]; then
        echo "Usage: gcb <repository>"
        return 1
    fi

    local repo_url="$1"
    local repo_name=$(basename "$repo_url" .git)

    git clone --bare "$repo_url" "$repo_name"
}

dota() {
    pushd $HOME >/dev/null
    dotfile=$(dotfiles diff --name-only | sort | fzf -m) && dotfiles add $dotfile
    popd >/dev/null 
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
SDKMAN_DIR="/home/oysandvik/.sdkman" 
[[ -s "/home/oysandvik/.sdkman/bin/sdkman-init.sh" ]] && source "/home/oysandvik/.sdkman/bin/sdkman-init.sh"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
