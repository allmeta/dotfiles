# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

ZSH_THEME="refined"


HIST_STAMPS="dd/mm/yyyy"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias f)

alias ranger='source ranger'
export VISUAL='vim'
export TERMINAL='kitty'
alias theme="~/.colors/theme.sh"
alias imgur="imgur.sh"
