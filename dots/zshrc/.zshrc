##using curl
function transfer() {
    curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | tee /dev/null | xclip -selection clipboard && notify-send "Transfer" "Url copied to clipboard"
}
function transfer_encrypt() {
	cat $1 | gpg -ac -o- | curl -X PUT --progress-bar --upload-file "-" https://transfer.sh/$(basename $1) | tee /dev/null | xclip -selection clipboard && notify-send "Transfer" "Url copied to clipboard"

}
# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

export PATH=~/.local/bin:$PATH

ZSH_THEME="refined"
HIST_STAMPS="dd/mm/yyyy"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias f)

alias ranger='source ranger'
alias transfer=transfer
alias transfer_encrypt=transfer_encrypt
alias fn='find -name'
