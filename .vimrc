syntax on

set splitbelow splitright
set noerrorbells

set tabstop=4 softtabstop=4
set expandtab
set smartindent
set nu
set nowrap
" set nobackup
set encoding=utf-8

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
" Plug 'itchyny/lightline.vim'
Plug 'git@github.com:tpope/vim-fugitive'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'git@github.com:Valloric/YouCompleteMe.git'

call plug#end()

set laststatus=2
" export TERM=xterm-256color
if !has('gui_running')
        set t_Co=256
endif

colorscheme gruvbox
set background=dark
map <C-s> :w

