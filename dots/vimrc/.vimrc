if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
" Plug 'ayu-theme/ayu-vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ajh17/VimCompletesMe'
call plug#end()

let mapleader=" "

set termguicolors
set term=builtin_xterm
set nocompatible
set tabstop=2
set relativenumber
set nu rnu
set laststatus=2
set noshowmode
set encoding=UTF-8
set background=dark
set ttimeout
set ttimeoutlen=1
set ttyfast
" set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
let &t_SI = "\<Esc>[6 q"
let &t_EI = "\<Esc>[1 q"
set list lcs=space:.
set shiftwidth=2 
set softtabstop=2
set expandtab
set splitbelow splitright
set wildmenu
set wildmode=longest:full,full
set cul
set autochdir "auto change dir xd

" shortcut split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
augroup EditVim
  autocmd!
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  "close vim if only nerdtree is open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

colorscheme gruvbox

" let ayucolor="dark"

"gruvbox inverted selection color
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

"nerdtree
map <C-n> :NERDTreeToggle<CR>

"custom statusline
" set statusline=%f%m%r%w%=%y[%p%%][%l,%v]
set statusline=%#Function#%t%m\ %=%Y\ %p%%\ %l,%v
" https://www.vi-improved.org/recommendations/

"visual indent
xnoremap > >gv
xnoremap < <gv

" fzf
" nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files --hidden' : ':GFiles --exclude-standard --others --cached')."\<cr>"
map <C-p> :Files<CR>
