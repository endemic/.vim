set nocompatible " Required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Tab autocomplete
Plugin 'ervandew/supertab'

" Fuzzy file search
Plugin 'kien/ctrlp.vim'
set wildignore+=*/node_modules/*

" Syntax highlighting
Plugin 'tpope/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'rust-lang/rust.vim'
Plugin 'lambdatoast/elm.vim'

" Remove trailing whitespace
Plugin 'csexton/trailertrash.vim'
let g:trailertrash_blacklist = ['.git/COMMIT_EDITMSG'] " don't show trailing whitespace when committing

" Static analysis
Plugin 'scrooloose/syntastic'

" Text search
Plugin 'rking/ag.vim'

" Status bar
Plugin 'bling/vim-airline'
"let g:airline_powerline_fonts = 1 " Use powerline fonts in airline
let g:airline#extensions#tabline#enabled = 1 " Add tabline extension

call vundle#end()         " Required
filetype plugin indent on " Required

" http://vimcolors.com/
set t_Co=256 " Enable 256 colors
colorscheme molokai
syntax on

" Improve syntax highlighting
au BufRead,BufNewFile Gemfile,Guardfile,*.ru,*.pill set filetype=ruby
au BufRead,BufNewFile *.hamlc set filetype=haml
au BufRead,BufNewFile *.json,*.ejs set filetype=javascript

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
set pastetoggle=<F2> " Use F2 for proper paste indentation

" tabwidth
autocmd FileType php setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType coffeescript setlocal shiftwidth=2 tabstop=2 noexpandtab

" Move to adjacent tabs with ctrl+h/ctrl+l
map <C-h> gT
map <C-l> gt

set splitbelow
set splitright

" Use Silver Searcher for CtrlP
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

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
