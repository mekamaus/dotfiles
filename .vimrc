set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'google/vim-maktaba'
  Plugin 'google/vim-codefmt'
  Plugin 'google/vim-glaive'
call vundle#end()

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType go execute ':et!'
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

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

set tabstop=2
set shiftwidth=2
set expandtab

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set nobackup
set nowb
set noswapfile

let g:airline_powerline_fonts = 1
