alias dockem='docker run -it --rm --volume "/home/meta/git/emerald:/home/docker/src" --workdir     "/home/docker/src" portoleks/in5570v20:latest'
alias gl="git pull"
alias gp="git push"
alias gc="git commit -m"
alias gco="git checkout"
alias glo="git log"
alias gst="git status"
alias gd="git diff"
alias ga="git add"
alias gb="git branch"
alias gsta="git stash push"
alias gcl="git clone"
alias gr="git rebase"

starship init fish | source
