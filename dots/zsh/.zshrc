# Enable Powerlevel10k instant prompt.
# This must be the very first thing in your .zshrc file to be effective.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Zsh History Configuration ---
export HISTFILE=~/.zsh_history
export HIST_STAMPS="dd/mm/yyyy"
export HISTSIZE=100000
export SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS
setopt histsavenodups
setopt histreduceblanks
setopt incappendhistorytime

# The following lines were added by compinstall
#zstyle :compinstall filename '/home/thomal/.zshrc'

#fpath=(/usr/share/zsh/site-functions/ $fpath)
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
# End of lines added by compinstall

# --- Completion styles ---
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu no
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/compcache"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'

# fzf-tab must load after compinit, before widget-wrapping plugins
source ~/git/fzf-tab/fzf-tab.plugin.zsh

# carapace: rich completions for hundreds of CLIs
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
source <(carapace _carapace zsh)

# fzf key bindings (Ctrl+R history, Ctrl+T file picker, Alt+C cd) + completion
source <(fzf --zsh)

# zsh-syntax-highlighting must load last (wraps widgets)
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- Alias and Function Definitions ---
function transfer() {
  url=$(curl --progress-bar --upload-file "$1" "https://transfer.sh/$(basename "$1")")
  echo "$url"
  echo "$url" | wl-copy
  notify-send "Transfer" "$url copied to clipboard"
}

function gc(){
  git commit -m "$*"
}

function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

yay() {
  case "$1" in
    -S)
      shift
      for pkg in "$@"; do
        nix profile add "nixpkgs#$pkg" --impure
      done
      ;;
    -R)
      shift
      for pkg in "$@"; do
        nix profile remove "$pkg"
      done
      ;;
    "")
      echo "usage: yay <query> | yay -S <pkg...> | yay -R <pkg...>"
      ;;
    *)
      nix search nixpkgs "$1"
      ;;
  esac
}


# Git aliases
alias gcp="git cherry-pick"
alias gl="git pull"
alias gf="git fetch"
alias gp="git push"
alias glo="git log"
alias glo1="git log --oneline"
alias gcl="git clone"
alias ga="git add"
alias gco="git checkout"
alias gd="git diff"
alias gst="git status"
alias gsta="git stash push"
alias grho="git grho"
alias grl="git reflog"
alias lg="lazygit"
alias ld="lazydocker"
alias y=yy

# General aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='ls --color'
alias open="xdg-open"
alias vim=nvim

# --- Key Bindings ---
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# --- Prompt Theme ---
source ~/git/powerlevel10k/powerlevel10k.zsh-theme

# Customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$PATH:/home/thomal/.local/bin"
# nvm
export PATH="$PATH:/home/thomal/.nvm/versions/node/v22.20.0/bin"
# pnpm
export PNPM_HOME="/home/thomal/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# dotnet
export PATH="$PATH:/home/thomal/.dotnet/tools"
#
source $HOME/.nix-profile/share/nix-direnv/direnvrc
eval "$(direnv hook zsh)"

eval "$(zoxide init zsh --cmd cd)"

# opencode
export PATH=/home/thomal/.opencode/bin:$PATH
