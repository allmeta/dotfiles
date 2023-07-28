# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


##using curl
function transfer() {
    url=`curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1)`
    echo $url
    echo $url | xsel -b
    notify-send "Transfer" "Url copied to clipboard"
}
function transfer_encrypt() {
	cat $1 | gpg -ac -o- | curl -X PUT --progress-bar --upload-file "-" https://transfer.sh/$(basename $1) | tee /dev/null | xclip -selection clipboard && notify-send "Transfer" "Url copied to clipboard"
}

function gc(){
  git commit -m "$*"
}

# git aliases
alias gl="git pull"
alias gp="git push"
alias glo="git log"
alias gcl="git clone"
alias ga="git add"
alias gco="git checkout"
alias gc=gc
alias gd="git diff"
alias gst="git status"
alias gsta="git stash push"
alias lg="lazygit"

alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls --color'
alias open="xdg-open"
alias v="$EDITOR"

#zsh-vi-mode
# Set the default WORDCHARS
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh

# source highlighter
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source history nav
export HISTFILE=~/.zsh_history
export HIST_STAMPS="dd/mm/yyyy"
export HISTSIZE=100000
export SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS
setopt histsavenodups
setopt histreduceblanks
setopt incappendhistorytime
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#completion
fpath=(/usr/share/zsh/site-functions/ $fpath)
autoload -U compinit && compinit
## case-insensitive (uppercase from lowercase) completion
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## case-insensitive (all) completion
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
## case-insensitive,partial-word,substr
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*' menu select


# powerline prompt
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
