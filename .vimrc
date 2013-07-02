set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" bundles here
Bundle 'ervandew/supertab'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdtree'
Bundle 'jiangmiao/auto-pairs'
Bundle 'kien/ctrlp.vim'

filetype plugin indent on

if has("gui_running")
  set guifont=Consolas:h14
  set lines=80
  set columns=100
endif

set t_Co=256 " Enable 256 colors
colorscheme vividchalk
syntax on

set nocompatible
set number ruler " show line numbers
set colorcolumn=80
set cursorline
set encoding=utf8
set fileencoding=utf8
set nowrap
set expandtab " tabs -> spaces
set shiftwidth=2
set tabstop=2 " 2 spaces per tab

map <S-h> gT
map <S-l> gt
