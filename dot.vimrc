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
Bundle 'mojako/ref-sources.vim'
Bundle 'thinca/vim-ref'
Bundle 'Align'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'vim-coffee-script'
Bundle 'motemen/git-vim'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-markdown'

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
let tex_flavor = 'latex'
set grepprg=grep\ -nH\ $*
set shellslash
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'

set wildmenu                   " コマンド補完を強化
set wildchar=<tab>             " コマンド補完を開始するキー

"Ref webdictでalcを使う設定
nmap ,alc :<C-u>Ref webdict alc<Space>
let g:ref_source_webdict_cmd = 'lynx -dump -nonumbers %s'
"let g:ref_source_webdict_use_cache = 1
let g:ref_source_webdict_sites = {
      \ 'alc' : {
      \   'url' : 'http://eow.alc.co.jp/%s/UTF-8/'
      \   }
      \ }
function! g:ref_source_webdict_sites.alc.filter(output)
    return join(split(a:output, "\n")[42 :], "\n")
  endfunction
