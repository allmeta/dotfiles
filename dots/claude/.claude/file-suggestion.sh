#!/bin/bash
# Fuzzy @ file autocomplete for Claude Code (fileSuggestion setting).
QUERY=$(jq -r '.query // ""')
cd "${CLAUDE_PROJECT_DIR:-.}" || exit 1

# ~/, / or ../ path: folder part is exact, only the last segment is fuzzy, one level deep.
# e.g. ~/Downloads/o2 -> ~/Downloads/orbeon2.csv
if [[ $QUERY == "~/"* || $QUERY == /* || $QUERY == ../* ]]; then
  prefix=${QUERY%/*}/ q=${QUERY##*/}
  cd "${prefix/#\~/$HOME}" 2>/dev/null || exit 0
  # "^o o2": name must start with the first typed letter, rest fuzzy (stops o2 matching "eksport 2026")
  fd --hidden --max-depth 1 | fzf --scheme=path --filter "${q:+^${q:0:1} }$q" | head -15 |
    while IFS= read -r f; do printf '%s%s\n' "$prefix" "$f"; done
  exit 0
fi

# hidden files everywhere except ~, where they are 1.5M files and lag every keystroke
[[ $PWD == "$HOME" ]] || hidden=(--hidden --exclude .git)
# like opencode: rank by fuzzy score, ties go to the shorter path (fzf path scheme default)
fd --type f --type d "${hidden[@]}" | fzf --scheme=path --filter "$QUERY" | head -15
