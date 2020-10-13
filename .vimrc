set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"  Plugin 'govim/govim'
  Plugin 'c.vim'
  Plugin 'solarnz/thrift.vim'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'google/vim-maktaba'
  Plugin 'google/vim-codefmt'
  Plugin 'junegunn/fzf.vim'
  Plugin 'majutsushi/tagbar'
  Plugin 'ryanoasis/vim-devicons'
  Plugin 'preservim/nerdtree'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'w0ng/vim-hybrid'
  Plugin 'nanotech/jellybeans.vim'
  Plugin 'tpope/vim-eunuch'
  Plugin 'christoomey/vim-tmux-navigator'
  Plugin 'scrooloose/syntastic'
call vundle#end()

"set background=dark
colorscheme ron
"let g:jellybeans_overrides = {
"  \    'MatchParen': { 'guifg': 'ffffff', 'guibg': '556779' },
"  \}

" Disable YCM preview window
set completeopt-=preview

set encoding=utf8
set guifont=MesloLGS\ NF:h14
let g:airline_powerline_fonts = 1

"au BufRead,BufNewFile *.thrift set filetype=thrift
"au! Syntax thrift source ~/.vim/thrift.vim

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cc,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

" Signify (Git gutter) config
set updatetime=100

" Tab shortcuts
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tn :tabnew<CR>

" NERDTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

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

set number

let g:airline_powerline_fonts = 1

let $USE_SYSTEM_GO=1

set nowrap
set formatoptions-=t

set colorcolumn=80

set clipboard=unnamed

let g:go_fmt_command = 'goimports'

let g:go_debug=['shell_commands']

"let g:ycm_clangd_binary_path = '/usr/local/bin/clangd'

let g:C_Ctrl_j = 'off'

if expand('%:t') =~?'bash-fc-\d\+'
  setfiletype sh
endif

set rtp+=/usr/local/opt/fzf

noremap <leader>cf :pyf /usr/local/opt/llvm/bin/clang-include-fixer<cr>
let g:clang_include_fixer_path = '/usr/local/opt/llvm/bin/clang-include-fixer'

nnoremap <silent> <Leader>b :TagbarToggle<CR>

let g:ycm_semantic_triggers = {
      \   'c': ['.', '->', 're!\w{1}'],
      \ }
let g:ycm_always_populate_location_list = 1

set pumheight=8

"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

let g:ctrlp_use_caching = 0

nnoremap <leader>fi :YcmCompleter FixIt<CR>

set foldmethod=syntax
set foldlevel=99

let g:syntastic_cpp_compiler = "gcc"
let g:syntastic_cpp_compiler_options = "-std=c++17 -Wall -Wextra -Wpedantic"

