# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec sway
    end
end

alias gl="git pull"
alias gp="git push"
alias gco="git checkout"
alias gc="git commit -m"
alias glo="git log"
alias gst="git status"
alias gd="git diff"
alias ga="git add"
alias gb="git branch"
alias gsta="git stash push"
alias gcl="git clone"
alias gr="git rebase"
