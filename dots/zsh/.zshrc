# Enable Powerlevel10k instant prompt.
# This must be the very first thing in your .zshrc file to be effective.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source the first file that exists (plugin paths differ between Ubuntu/~/git and Arch)
_source_first() {
  local f
  for f in "$@"; do
    [[ -r $f ]] && { source "$f"; return 0 }
  done
  return 1
}

# --- Prompt Theme (load early so real prompt replaces cached one ASAP) ---
_source_first ~/git/powerlevel10k/powerlevel10k.zsh-theme \
  /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
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

_source_first ~/git/zsh-defer/zsh-defer.plugin.zsh \
  /usr/share/zsh-defer/zsh-defer.plugin.zsh ||
  zsh-defer() { "$@" }  # not installed: run immediately instead

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
zsh-defer _source_first ~/git/fzf-tab/fzf-tab.plugin.zsh \
  /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh \
  /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

# fzf key bindings (Ctrl+R history, Ctrl+T file picker, Alt+C cd) + completion
() {
  local cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/fzf.zsh"
  if [[ ! -s "$cache" || "${commands[fzf]}" -nt "$cache" ]]; then
    mkdir -p "${cache:h}" && fzf --zsh > "$cache"
  fi
  source "$cache"
}

# zsh-syntax-highlighting must load after compinit (deferred)
zsh-defer _source_first /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
  /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# up/down arrow history substring search (must load after syntax-highlighting), if installed
_load_substring_search() {
  _source_first /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh \
    /usr/share/zsh-history-substring-search/zsh-history-substring-search.zsh || return
  bindkey "^[[A" history-substring-search-up
  bindkey "^[[B" history-substring-search-down
}
zsh-defer _load_substring_search

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

export PATH="$PATH:$HOME/.local/bin"
export _ZO_DOCTOR=0
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# dotnet
export PATH="$PATH:$HOME/.dotnet/tools"
#
(( $+commands[direnv] )) && () {
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
export PATH=$HOME/.opencode/bin:$PATH

# Claude Code: make AFK / question prompts wait up to 1 week (604800000 ms) instead of ~60s.
# NOTE: not confirmed as a recognized Claude Code setting — may be a no-op.
export CLAUDE_AFK_TIMEOUT_MS=604800000
