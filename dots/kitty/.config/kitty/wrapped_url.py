# Hints processor for URLs that the app (e.g. Claude Code) hard-wrapped with newline + indent.
import re

# ponytail: heuristic — a continuation line joins only if its first token looks URL-ish
# (has / ? & = % # or a digit); a URL ending exactly at a line break followed by such a token over-joins.
URL_RE = re.compile(r'https?://[^\s<>"\'`]+(?:\n[ \t]*(?=[^\s<>"\'`]*[/?&=%#0-9])[^\s<>"\'`]+)*')


def mark(text, args, Mark, extra_cli_args, *a):
    for idx, m in enumerate(URL_RE.finditer(text)):
        start, end = m.span()
        url = re.sub(r'[\n\0][ \t]*', '', text[start:end]).rstrip('.,;:)]}')
        yield Mark(idx, start, end, url, {})


def handle(boss, target_window_id, data, extra_cli_args, *a):
    for url in data['match']:
        if url:
            boss.open_url(url)
