set nocompatible " be iMproved

filetype off " required!

set rtp+=~/.vim/bundle/vundle/set nocompatible " be iMproved

filetype off " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'tpope/vim-rails'
Bundle 'ruby.vim'
Bundle 'unite.vim'
Bundle 'neocomplcache'
Bundle 'scrooloose/nerdtree'
Bundle 'Solarized'
Bundle 'ref.vim'
Bundle 'mojako/ref-sources.vim'
"Bundle 'Gentooish'
Bundle 'xterm16.vim'
Bundle 'Align'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'vim-coffee-script'
Bundle 'motemen/git-vim'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'groenewege/vim-less'

filetype indent plugin on
set number
syntax on
set ts=2
set expandtab
set sw=2
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp
set fileformat=unix

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
highlight link ZenkakuSpace Error
"match ZenkakuSpace /　/

ab #r #coding:utf-8
"
let g:unite_enable_start_insert=1
"
noremap <C-P> :Unite buffer<CR>
"
noremap <C-N> :Unite -buffer-name=files buffer_tab file_mru file bookmark file/new<CR>
"
noremap <C-Z> :Unite file_mru<CR>
set mouse=a

set laststatus=2 "ステータスバーを常に表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"vim latex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'platex --interaction=nonstopmode $* && dvipdfmx $*.dvi'
