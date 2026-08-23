# Enable Powerlevel10k instant prompt.
# This must be the very first thing in your .zshrc file to be effective.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Prompt Theme (load early so real prompt replaces cached one ASAP) ---
source ~/git/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- Zsh History Configuration ---
export HISTFILE=~/.zsh_history
export HIST_STAMPS="dd/mm/yyyy"
export HISTSIZE=100000
export SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS
setopt histsavenodups
setopt histreduceblanks
setopt incappendhistorytime

# fpath: generated per-tool completions + zsh-completions community definitions
fpath=(
  ~/.config/zsh/completions
  ~/git/zsh-completions/src
  $fpath
)

source ~/git/zsh-defer/zsh-defer.plugin.zsh

autoload -Uz compinit
# Load the precompiled dump as-is; never rebuild on startup.
# Must run synchronously (NOT via zsh-defer) — deferring compinit corrupts the
# dump and drops completions for tools like fd. -C is cheap; it just loads the dump.
# Regenerate manually after adding/removing a completion: rebuild-zcompdump
compinit -C

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

# fzf-tab must load after compinit
zsh-defer source ~/git/fzf-tab/fzf-tab.plugin.zsh

# fzf key bindings (Ctrl+R history, Ctrl+T file picker, Alt+C cd) + completion
() {
  local cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/fzf.zsh"
  if [[ ! -s "$cache" || "${commands[fzf]}" -nt "$cache" ]]; then
    mkdir -p "${cache:h}" && fzf --zsh > "$cache"
  fi
  source "$cache"
}

# zsh-syntax-highlighting must load after compinit (deferred)
zsh-defer source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# Rebuild the completion dump from scratch and recompile it.
# Run after installing/removing a tool that ships a _completion file.
function rebuild-zcompdump() {
  local dump="${ZDOTDIR:-$HOME}/.zcompdump"
  rm -f "$dump" "$dump.zwc"
  autoload -Uz compinit && compinit -u -d "$dump"
  zcompile "$dump"
  echo "rebuilt $dump"
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
alias c=claude

# --- Key Bindings ---
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '\ev' edit-command-line

export PATH="$PATH:/home/thomal/.local/bin"
export _ZO_DOCTOR=0
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
() {
  local cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/direnv.zsh"
  if [[ ! -s "$cache" || "${commands[direnv]}" -nt "$cache" ]]; then
    mkdir -p "${cache:h}" && direnv hook zsh > "$cache"
  fi
  source "$cache"
}

() {
  local cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zoxide.zsh"
  if [[ ! -s "$cache" || "${commands[zoxide]}" -nt "$cache" ]]; then
    mkdir -p "${cache:h}" && zoxide init zsh --cmd cd > "$cache"
  fi
  source "$cache"
}

# opencode
export PATH=/home/thomal/.opencode/bin:$PATH

# Claude Code: make AFK / question prompts wait up to 1 week (604800000 ms) instead of ~60s.
# NOTE: not confirmed as a recognized Claude Code setting — may be a no-op.
export CLAUDE_AFK_TIMEOUT_MS=604800000
