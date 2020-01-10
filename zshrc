##using curl
function transfer() {
    curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | tee /dev/null | xclip -selection clipboard
}
function transfer_encrypt() {
	cat $1 | gpg -ac -o- | curl -X PUT --progress-bar --upload-file "-" https://transfer.sh/$(basename $1) | tee /dev/null | xclip -selection clipboard
}
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
alias transfer=transfer
alias transfer_encrypt=transfer_encrypt
