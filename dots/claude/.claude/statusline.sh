#!/usr/bin/env bash
# Claude Code statusline: dir · git · model · effort · context
input=$(cat)

j() { jq -r "$1 // empty" <<<"$input" 2>/dev/null; }

# Human-readable token count: 51181 -> 51k, 1000000 -> 1M
fmt() {
  local n=$1
  if   [ "$n" -ge 1000000 ]; then awk -v n="$n" 'BEGIN{v=n/1000000; printf (v==int(v)?"%dM":"%.1fM"), v}'
  elif [ "$n" -ge 1000 ];    then printf '%dk' $(( n / 1000 ))
  else printf '%d' "$n"; fi
}

model=$(j '.model.display_name')
dir=$(j '.workspace.current_dir')
[ -z "$dir" ] && dir=$(j '.cwd')
effort=$(j '.effort.level')
ctx=$(j '.context_window.used_percentage')
size=$(j '.context_window.context_window_size')
used=$(j '.context_window.current_usage | (.input_tokens // 0) + (.cache_creation_input_tokens // 0) + (.cache_read_input_tokens // 0)')
five=$(j '.rate_limits.five_hour.used_percentage')
week=$(j '.rate_limits.seven_day.used_percentage')
five_reset=$(j '.rate_limits.five_hour.resets_at')
week_reset=$(j '.rate_limits.seven_day.resets_at')

# Colors
R=$'\e[0m'; DIM=$'\e[2m'
BLUE=$'\e[38;5;75m'; MAG=$'\e[38;5;176m'; GRN=$'\e[38;5;114m'
YEL=$'\e[38;5;221m'; RED=$'\e[38;5;203m'; ORG=$'\e[38;5;215m'
CYAN=$'\e[38;5;80m'
SEP="${DIM} │ ${R}"

out="${BLUE}"$''" ${dir/#$HOME/"~"}${R}"

# Git branch + dirty marker
if [ -n "$dir" ] && branch=$(git -C "$dir" symbolic-ref --short -q HEAD 2>/dev/null || git -C "$dir" rev-parse --short HEAD 2>/dev/null); then
  dirty=""
  [ -n "$(git -C "$dir" --no-optional-locks status --porcelain 2>/dev/null | head -1)" ] && dirty="${YEL}*"
  out+="${SEP}${MAG}"$''" ${branch}${dirty}${R}"
fi

[ -n "$model" ] && out+="${SEP}${ORG}✻ ${model}${R}"
[ -n "$effort" ] && out+="${SEP}${CYAN}◆ ${effort}${R}"

# Color for a percentage: green < 50 <= yellow < 80 <= red
pct_color() {
  if   [ "$1" -ge 80 ]; then printf '%s' "$RED"
  elif [ "$1" -ge 50 ]; then printf '%s' "$YEL"
  else printf '%s' "$GRN"; fi
}

# Labeled limit: limit <label> <percentage> <reset epoch> <date format>
limit() {
  local pct=${2%.*} reset=""
  [ -n "$3" ] && reset=" ${DIM}($(date -d "@$3" +"$4"))${R}"
  printf '%s' "${DIM}$1${R} $(pct_color "$pct")${pct}%${R}${reset}"
}

# Context token counts, colored by fill level
if [ -n "$used" ] && [ -n "$size" ]; then
  ctx=${ctx%.*}
  out+="${SEP}$(pct_color "${ctx:-0}")$(fmt "$used") / $(fmt "$size")${R}"
fi

[ -n "$five" ] && out+="${SEP}$(limit usage "$five" "$five_reset" '%H:%M')"
[ -n "$week" ] && out+="${SEP}$(limit weekly "$week" "$week_reset" '%a %H:%M')"

printf '%s' "$out"
