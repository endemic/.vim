set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" bundles here
Bundle 'ervandew/supertab'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-haml'
Bundle 'FuDesign2008/jslhint.vim'
Bundle 'rking/ag.vim'
Bundle 'bling/vim-airline'

filetype plugin indent on

set t_Co=256 " Enable 256 colors
colorscheme molokai
syntax on

if has("gui_running")
  set guifont=Consolas:h14
endif

set nocompatible
set number ruler " show line numbers
set colorcolumn=80
set cursorline
set encoding=utf8
set fileencoding=utf8
set nowrap
set expandtab    " tabs -> spaces
set shiftwidth=2
set tabstop=2    " 2 spaces per tab
set laststatus=2 " Always show status bar
set lazyredraw   " Try to draw faster

let g:airline_powerline_fonts = 1 " Use powerline fonts in airline

map <C-h> gT
map <C-l> gt

set pastetoggle=<F2>

set splitbelow
set splitright

" Improve syntax highlighting
au BufRead,BufNewFile Gemfile,Guardfile set filetype=ruby
au BufRead,BufNewFile *.hamlc set filetype=haml
au BufRead,BufNewFile *.json set filetype=javascript

" Create directory on save if needed
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
 endif
endfunction
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
