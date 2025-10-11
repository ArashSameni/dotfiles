export EDITOR=nvim
export GOPATH=$(go env GOPATH)
export NVM_DIR="$HOME/.nvm"

local path_dirs=(
    "$HOME/.local/bin"
    "$HOME/.cargo/bin"
    "$HOME/.bun/bin"
    "$GOPATH/bin"
    "/var/lib/snapd/snap/bin"
)
export PATH="$PATH:${(j|:|)path_dirs}"
unset path_dirs

eval "$(pyenv init -)"

export ZSH="$HOME/.oh-my-zsh"
plugins=(
    git
    sudo
    web-search
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    fast-syntax-highlighting
    copyfile
    copybuffer
    dirhistory
)

source $ZSH/oh-my-zsh.sh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

source <(fzf --zsh)

eval "$(zoxide init zsh)"

eval "$(oh-my-posh init zsh --config /usr/share/oh-my-posh/themes/agnoster.omp.json)"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

alias cd='z'
alias ls='eza -a --icons=always'
alias wifi='nmtui'
alias vim='nvim'
alias open='xdg-open'
