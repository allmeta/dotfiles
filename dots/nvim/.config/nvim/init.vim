" install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')
Plug 'lifepillar/vim-gruvbox8'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-fugitive'
Plug 'romgrk/barbar.nvim'
" Plug 'ayu-theme/ayu-vim'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'ionide/ionide-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'tpope/vim-surround'
Plug 'direnv/direnv.vim'
Plug 'tpope/vim-commentary'
Plug 'ajh17/VimCompletesMe'
Plug 'nvim-treesitter/nvim-treesitter', {'do':':TSUpdate'}
call plug#end()

let mapleader=" "

set guifont=Fantasque\ Sans\ Mono:h16
set nocompatible
set tabstop=2
set relativenumber
set nu rnu
set laststatus=2
set noshowmode
set encoding=UTF-8
set background=dark
" set ttimeout
set ttimeoutlen=0
set ttyfast
" set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[1 q"
set shiftwidth=2 
set softtabstop=2
set expandtab
set splitbelow splitright
set wildmenu
set wildmode=longest:full,full
set cul

" shortcut split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
augroup EditVim
  autocmd!
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  "commentary.vim
  autocmd FileType vim setlocal commentstring=\"\ %s
  autocmd FileType javascript setlocal commentstring=//\ %s
  autocmd FileType emerald setlocal commentstring=\%\ %s

  "emerald mode
  au BufNewFile,BufRead *.m setlocal ft=emerald
augroup END

if !has('gui_running')
  set t_Co=256
endif

let g:gruvbox_contrast_dark='hard'
set background=dark
let g:gruvbox_transp_bg = 1
let g:gruvbox_filetype_hi_groups = 1

" colorscheme gruvbox8

" let ayucolor="dark"

"custom statusline
" set statusline=%f%m%r%w%=%y[%p%%][%l,%v]
set statusline=%#Function#%t%m\ %=%Y\ %p%%\ %l,%v
" https://www.vi-improved.org/recommendations/

"visual indent
xnoremap > >gv
xnoremap < <gv

"prevent clipboard hijacking
inoremap <C-r> <C-r><C-o>

" assumes set ignorecase smartcase
set ignorecase smartcase
augroup dynamic_smartcase
  autocmd!
  autocmd CmdLineEnter : set nosmartcase
  autocmd CmdLineLeave : set smartcase
augroup END

" fzf
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files --hidden' : ':GFiles --exclude-standard --others --cached')."\<cr>"
nnoremap <C-p> <cmd>Telescope find_files<cr>

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"haskell","javascript","typescript",},
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

" coc
" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" barbar
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>

"nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>
let g:nvim_tree_side = "left"
let g:nvim_tree_width = 25
let g:nvim_tree_ignore = ['.git', 'node_modules', '.cache']
let g:nvim_tree_auto_open = 0
let g:nvim_tree_auto_close = 0
let g:nvim_tree_quit_on_open = 0
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_root_folder_modifier = ":~"
let g:nvim_tree_allow_resize = 1
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }
