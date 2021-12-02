" install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

" colorscheme
Plug 'lifepillar/vim-gruvbox8'
Plug 'ayu-theme/ayu-vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

" barbar
Plug 'ryanoasis/vim-devicons'
Plug 'romgrk/barbar.nvim'

" nvim-tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" completion, treesitter etc
" Plug 'hrsh7th/nvim-cmp'
Plug 'ackyshake/VimCompletesMe'
Plug 'nvim-treesitter/nvim-treesitter', {'do':':TSUpdate'}
Plug 'neovim/nvim-lspconfig'

" etc
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
"Plug 'direnv/direnv.vim'
Plug 'tpope/vim-commentary'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
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
set ai
set splitbelow splitright
set wildmenu
set wildmode=longest:full,full
set cul
set hidden
set autochdir

" shortcut split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" cd to dir of file
nnoremap <leader>cd :cd %:p:h<CR>

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
let g:tokyonight_style = "night"

colorscheme tokyonight

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

" telescope
lua <<EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-L',
      '--ignore-file',
      '.gitignore'
    },
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      filetypes = {"png", "jpg", "mp4", "webm","pdf"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    },
  },
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('media_files')
EOF
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>

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
lua << EOF
	require'nvim-tree'.setup {
		disable_netrw       = true,
		hijack_netrw        = true,
		open_on_setup       = false,
		ignore_ft_on_setup  = {},
		update_to_buf_dir   = {
			enable = true,
			auto_open = true,
		},
		auto_close          = false,
		open_on_tab         = false,
		hijack_cursor       = false,
		update_cwd          = false,
		diagnostics         = {
			enable = false,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			}
		},
		update_focused_file = {
			enable      = false,
			update_cwd  = false,
			ignore_list = {}
		},
		system_open = {
			cmd  = nil,
			args = {}
		},
		view = {
			width = 30,
			height = 30,
			side = 'left',
			auto_resize = false,
			mappings = {
				custom_only = false,
				list = {}
			}
		},
		filters = {
dotfiles = false,
custom = {}
		}
	}
EOF
nnoremap <C-n> :NvimTreeToggle<CR>

" lspconfig

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       debounce_text_changes = 150,
--     }
--   }
-- end
EOF

" nvim-autopairs
lua << EOF
require('nvim-autopairs').setup{}

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
      return npairs.esc("<cr>")
  else
    return npairs.autopairs_cr()
  end
end


remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

EOF
