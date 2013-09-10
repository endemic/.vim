set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Tab autocomplete
Bundle 'ervandew/supertab'

" File explorer
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

" Fuzzy file search
Bundle 'kien/ctrlp.vim'

" Syntax highlighting
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'kchmck/vim-coffee-script'

" Remove trailing whitespace
Bundle 'csexton/trailertrash.vim'
let g:trailertrash_blacklist = ['.git/COMMIT_EDITMSG'] " don't show trailing whitespace when committing

" Static analysis
Bundle 'scrooloose/syntastic'
Bundle 'FuDesign2008/jslhint.vim'

" Text search
Bundle 'rking/ag.vim'

" Status bar
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1 " Use powerline fonts in airline

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
set scrolloff=3  " Start scrolling 3 lines before the border

" Move to adjacent tabs with ctrl+h/ctrl+l
map <C-h> gT
map <C-l> gt

set pastetoggle=<F2>

set splitbelow
set splitright

" Improve syntax highlighting
au BufRead,BufNewFile Gemfile,Guardfile,*.ru set filetype=ruby
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
