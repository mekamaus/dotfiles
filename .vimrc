set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on

syntax on

set laststatus=2

set t_Co=256
syntax enable
set background=dark

set hlsearch
set incsearch
set magic
set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set nobackup
set nowb
set noswapfile

let g:airline_powerline_fonts = 1
