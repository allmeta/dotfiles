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
  ~/.nix-profile/share/zsh/site-functions
  /nix/var/nix/profiles/default/share/zsh/site-functions
  ~/.config/zsh/completions
  ~/git/zsh-completions/src
  $fpath
)

source ~/git/zsh-defer/zsh-defer.plugin.zsh

autoload -Uz compinit
# Must run synchronously (NOT via zsh-defer) — deferring compinit corrupts the dump.
# No -C: compinit rebuilds the dump itself when fpath gains/loses completions
# (e.g. after `nix profile add`). Measured as fast as -C here.
compinit -u

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

_yay() {
  if (( CURRENT == 2 )); then
    _describe 'action' '(-S:install -R:remove)'
  elif [[ $words[2] == -S ]]; then
    # every package (incl. nested like python3Packages.foo) in the pinned nixpkgs, cached to a file;
    # rebuilt (~3s) when the pin (registry.json) changes.
    local cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/nixpkgs-names"
    if [[ ! -s $cache || ~/.config/nix/registry.json -nt $cache ]]; then
      mkdir -p "${cache:h}"
      nix search nixpkgs '^' --json 2>/dev/null \
        | jq -r 'keys[] | sub("^legacyPackages\\.[^.]+\\."; "")' > "$cache.tmp" \
        && [[ -s $cache.tmp ]] && mv "$cache.tmp" "$cache"
    fi
    # fzf directly on the file: fzf-tab loops over every candidate in zsh (~20s for 113k).
    local preview; zstyle -s ':fzf-tab:complete:yay:' fzf-preview preview
    local -a sel=(${(f)"$(fzf --multi --height=60% --reverse --query="$PREFIX" \
      --preview="word={}; $preview" --preview-window=right:50%:wrap < $cache)"})
    (( $#sel )) && compadd -U -Q -- "${(j: :)sel}"
  elif [[ $words[2] == -R ]]; then
    local -a pkgs=(${(f)"$(nix profile list --json 2>/dev/null | jq -r '.elements | keys[]')"})
    _describe 'installed' pkgs
  fi
}
compdef _yay yay
zstyle ':fzf-tab:complete:yay:*' fzf-preview 'nix eval --json "nixpkgs#$word" --apply "p: { v = p.version or \"\"; d = p.meta.description or \"\"; l = p.meta.longDescription or \"\"; h = p.meta.homepage or \"\"; }" 2>/dev/null | jq -r "\"\(.v)\n\n\(.d)\n\n\(.l)\n\(.h)\""'


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
alias gs="git show"
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
alias p1='ping 1.1.1.1'

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
