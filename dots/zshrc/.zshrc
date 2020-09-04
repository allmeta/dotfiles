##using curl
function transfer() {
    curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | tee /dev/null | xclip -selection clipboard && notify-send "Transfer" "Url copied to clipboard"
}
function transfer_encrypt() {
	cat $1 | gpg -ac -o- | curl -X PUT --progress-bar --upload-file "-" https://transfer.sh/$(basename $1) | tee /dev/null | xclip -selection clipboard && notify-send "Transfer" "Url copied to clipboard"

}

# git aliases
alias gl="git pull"
alias gp="git push"
alias glo="git log"
alias gcl="git clone"
alias ga="git add"
alias gco="git checkout"
alias gc="git commit"
alias gd="git diff"
alias gst="git status"

HIST_STAMPS="dd/mm/yyyy"


eval $(thefuck --alias f)

alias transfer=transfer
alias transfer_encrypt=transfer_encrypt
alias fn='find -name'
alias dockem='docker run -it --rm --volume "$(pwd):/home/docker/src" --workdir "/home/docker/src" portoleks/in5570v20:latest'
alias icat="kitty +kitten icat"
if [ -e /home/meta/.nix-profile/etc/profile.d/nix.sh ]; then . /home/meta/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# source highlighter
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source history nav
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey  "^[[A" history-substring-search-up
bindkey  "^[[B" history-substring-search-down
# source starship
eval "$(starship init zsh)"
