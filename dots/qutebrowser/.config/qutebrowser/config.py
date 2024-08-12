config.load_autoconfig(True)
c.auto_save.session = True
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')


# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow websites to record audio.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.media.audio_capture', True, 'https://teams.microsoft.com')

# Allow websites to record video.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.media.video_capture', True, 'https://teams.microsoft.com')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.notifications.enabled = False

# Allow websites to register protocol handlers via
# `navigator.registerProtocolHandler`.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.register_protocol_handler = False
c.content.tls.certificate_errors = "load-insecurely"

# List of user stylesheet filenames to use.
# Type: List of File, or File
import glob
c.content.user_stylesheets = glob.glob("~/.config/qutebrowser/user-styles/*")

# color theme
config.source('qutewal.py')

# Where to show the downloaded files.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.downloads.position = 'bottom'

# Duration (in milliseconds) to wait before removing finished downloads.
# If set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = 0

# Editor (and arguments) to use for the `edit-*` commands. The following
# placeholders are defined:  * `{file}`: Filename of the file to be
# edited. * `{line}`: Line in which the caret is found in the text. *
# `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ['foot', '-e', 'nvim', '-f', '{file}']

# Handler for selecting file(s) in forms. If `external`, then the
# commands specified by `fileselect.single_file.command` and
# `fileselect.multiple_files.command` are used to select one or multiple
# files respectively.
# Type: String
# Valid values:
#   - default: Use the default file selector.
#   - external: Use an external command.
c.fileselect.handler = 'external'

# Command (and arguments) to use for selecting a single file in forms.
# The command should write the selected file path to the specified file
# or stdout. The following placeholders are defined: * `{}`: Filename of
# the file to be written to. If not contained in any argument, the
# standard output of the command is read instead.
# Type: ShellCommand
c.fileselect.single_file.command = ['foot', 'yazi', '--chooser-file', '{}']

# Command (and arguments) to use for selecting multiple files in forms.
# The command should write the selected file paths to the specified file
# or to stdout, separated by newlines. The following placeholders are
# defined: * `{}`: Filename of the file to be written to. If not
# contained in any argument, the   standard output of the command is
# read instead.
# Type: ShellCommand
c.fileselect.multiple_files.command = ['foot', 'yazi', '--chooser-file', '{}']

# Command (and arguments) to use for selecting a single folder in forms.
# The command should write the selected folder path to the specified
# file or stdout. The following placeholders are defined: * `{}`:
# Filename of the file to be written to. If not contained in any
# argument, the   standard output of the command is read instead.
# Type: ShellCommand
c.fileselect.folder.command = ['foot', 'yazi', '--cwd-file', '{}']

# When a hint can be automatically followed without pressing Enter.
# Type: String
# Valid values:
#   - always: Auto-follow whenever there is only a single hint on a page.
#   - unique-match: Auto-follow whenever there is a unique non-empty match in either the hint string (word mode) or filter (number mode).
#   - full-match: Follow the hint when the user typed the whole hint (letter, word or number mode) or the element's text (only in number mode).
#   - never: The user will always need to press Enter to follow a hint.
c.hints.auto_follow = 'always'

# Timeout (in milliseconds) for partially typed key bindings. If the
# current input forms only partial matches, the keystring will be
# cleared after this time. If set to 0, partially typed bindings are
# never cleared.
# Type: Int
c.input.partial_timeout = 0

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = True

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'top'

# Which tab to select when the focused tab is removed.
# Type: SelectOnRemove
# Valid values:
#   - prev: Select the tab which came before the closed one (left in horizontal, above in vertical).
#   - next: Select the tab which came after the closed one (right in horizontal, below in vertical).
#   - last-used: Select the previously selected tab.
c.tabs.select_on_remove = 'last-used'

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
c.tabs.show = 'multiple'

# Search engines which can be used via the address bar.  Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` braces.  The following further
# placeholds are defined to configure how special characters in the
# search terms are replaced by safe characters (called 'quoting'):  *
# `{}` and `{semiquoted}` quote everything except slashes; this is the
# most   sensible choice for almost all search engines (for the search
# term   `slash/and&amp` this placeholder expands to `slash/and%26amp`).
# * `{quoted}` quotes all characters (for `slash/and&amp` this
# placeholder   expands to `slash%2Fand%26amp`). * `{unquoted}` quotes
# nothing (for `slash/and&amp` this placeholder   expands to
# `slash/and&amp`). * `{0}` means the same as `{}`, but can be used
# multiple times.  The search engine named `DEFAULT` is used when
# `url.auto_search` is turned on and something else than a URL was
# entered to be opened. Other search engines can be used by prepending
# the search engine name to the search term, e.g. `:open google
# qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'http://localhost:8000?q={}&b=google'}

# Format to use for the window title. The same placeholders like for
# `tabs.title.format` are defined.
# Type: FormatString
c.window.title_format = '{perc}{current_title}{title_sep}qutebrowser'

# Default font families to use. Whenever "default_family" is used in a
# font setting, it's replaced with the fonts listed here. If set to an
# empty value, a system-specific monospace default is used.
# Type: List of Font, or Font
c.fonts.default_family = 'FiraCode Nerd Font'

# Default font size to use. Whenever "default_size" is used in a font
# setting, it's replaced with the size listed here. Valid values are
# either a float value with a "pt" suffix, or an integer value with a
# "px" suffix.
# Type: String
c.fonts.default_size = '9pt'

# Font family for standard fonts.
# Type: FontFamily
c.fonts.web.family.standard = 'Noto Sans'

# Font family for fixed fonts.
# Type: FontFamily
c.fonts.web.family.fixed = 'FiraCode Nerd Font'

# Default font size (in pixels) for regular text.
# Type: Int
c.fonts.web.size.default = 16

# Bindings for normal mode
config.bind('!', 'cmd-set-text :open -t !')
config.bind('1', 'cmd-set-text :open !')
config.bind(';i', 'hint images run :open -t {hint-url}')
config.bind(';m', 'hint links spawn mpv {hint-url}')
config.bind('<Escape>', 'fake-key <Escape> ;; fullscreen --leave')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('gj', 'tab-move -')
config.bind('gk', 'tab-move +')
config.bind('gJ', 'tab-move -')
config.bind('gK', 'tab-move +')
config.bind('P', 'open -t -- {clipboard}')
config.bind('W', 'tab-give')
config.bind('X', 'undo')
config.bind('d', 'scroll-px 0 350')
config.bind('gP', 'spawn --userscript qute-bitwarden -w')
config.bind('ge', 'cmd-set-text :open {url:pretty}')
config.bind('gi', 'hint inputs')
config.bind('gp', 'spawn --userscript qute-bitwarden')
config.bind('p', 'open -- {clipboard}')
config.bind('u', 'scroll-px 0 -350')
config.bind('x', 'tab-close')
config.bind('yf', 'hint links yank')
config.bind('yi', 'hint images yank')
config.bind('yt', 'tab-clone')
config.bind('ym', 'spawn mpv {url:pretty}')
config.bind('[', 'navigate prev')
config.bind(']', 'navigate next')
config.bind('ce', 'config-edit')
config.bind('cs', 'config-source')
config.bind('<Ctrl+h>', 'history -t')

config.bind('sw', 'set colors.webpage.bg white')
config.bind('si', 'jseval let s=document.createElement("style"); s.innerHTML="html, iframe, img, video {filter:invert(1) !important}"; document.body.appendChild(s)')

# toggle javascript for domain
config.bind('tj', 'config-cycle -p -u *://{url:host}/* content.javascript.enabled ;; reload')
config.bind('tp', 'jseval "{url:host} {url:domain} {url:scheme} {url:path}"')

# Bindings for command mode
config.bind('<Ctrl+w>', 'rl-backward-kill-word', mode='command')

# Bindings for prompt mode
config.bind('<Ctrl+w>', 'rl-backward-kill-word', mode='prompt')

# from PyQt6.QtCore import QUrl
# from qutebrowser.api import interceptor
# import re
#
# def intercept(info: interceptor.Request):
#     if re.search("(.*\\.reddit\\.com|redd\\.it)", info.request_url.host()):
#         new_url = QUrl(info.request_url)
#         new_url.setHost('libreddit.nl')
#         try:
#             info.redirect(new_url)
#         except:
#             pass
#
# interceptor.register(intercept)
