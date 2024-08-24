# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt sharehistory
setopt appendhistory
bindkey -e

# Alias
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias pwd='echo $PWD'
alias dcd='docker compose down'
alias dcu='docker compose up -d'
alias del='rm -rf'
alias sdel='sudo rm -rf'
alias ll='ls -lah'
alias debian='ssh debian'
alias pinstall='sudo pacman -S'
alias psearch='pacman -Ss'
alias pupdate='sudo pacman -Syyu'
alias yinstall='yay -S'
alias ysearch='yay -Ss'
alias gitgraph='git log --all --decorate --oneline --graph'
alias gitgraphfull='git log --graph --abbrev-commit --decorate --date=relative --all'
alias foldersize='sudo du -h --max-depth=1'
alias grep="grep --color=auto"

# Functions
function space() {
    local num="${1:-10}"  # Si no se proporciona el primer argumento, usa 10 como valor predeterminado
    local dir="${2:-.}"  # Si no se proporciona el segundo argumento, usa el directorio actual (".")
    sudo du -hd 1 "$dir" 2>/dev/null | sort -rh | head -n "$num"
}

function initssh() {
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/github_rlibanez
}

# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zsh plugins
fpath=(~/.config/zsh/plugins/zsh-completions/src $fpath)
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
