syntax on

set splitbelow splitright
set noerrorbells

set tabstop=4 softtabstop=4
set expandtab
set smartindent
set relativenumber
set number
set number relativenumber
set nowrap
" set nobackup
set encoding=utf-8

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'https://github.com/dbeniamine/cheat.sh-vim'
Plug 'git@github.com:tpope/vim-fugitive'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fvf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
" Plug 'git@github.com:Valloric/YouCompleteMe.git'

call plug#end()

set laststatus=2
" export TERM=xterm-256color
if !has('gui_running')
        set t_Co=256
endif

colorscheme gruvbox
" highlight Normal guibg=none

set background=dark
map <C-s> :w

let mapleader = " "
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>j :winc w<CR>
nnoremap tn :tabnew<Space>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>

inoremap jj <ESC>
nnoremap ; :
vnoremap ; :
nmap ,p "0p
nmap ,P "0P
nmap <up> <C-w><up>
nmap <down> <C-w><down>
nmap <left> <C-w><left>
nmap <right> <C-w><right>
nnoremap <leader>^ <C-^>

