set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-cucumber'
Bundle 'ruby.vim'
Bundle 'unite.vim'
Bundle 'neocomplcache'
Bundle 'scrooloose/nerdtree'
Bundle 'mojako/ref-sources.vim'
Bundle 'thinca/vim-ref'
Bundle 'motemen/git-vim'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-bundler'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'open-browser.vim'
Bundle 'tyru/open-browser-github.vim'
Bundle 'kenchan/Tomorrow-Theme'

filetype plugin indent on     " required!

colorscheme Tomorrow-Night

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
set listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:%

set directory-=.

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

"indent guides
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=cyan
hi IndentGuidesEven ctermbg=grey

" 行末の空白文字を可視化
highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", '\s\+$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", '\s\+$')

" 行頭のTAB文字を可視化
highlight TabString ctermbg=red guibg=red
au BufWinEnter * let w:m2 = matchadd("TabString", '^\t+')
au WinEnter * let w:m2 = matchadd("TabString", '^\t+')

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

"コマンドラインをEmacs風に編集する
:cnoremap <C-A> <Home>
:cnoremap <C-F> <Right>
:cnoremap <C-B> <Left>

"spe_cuke
function! s:SetupSpeCuke()
  command! RunTestFile exe '!sc ' . expand('%:p')
  command! RunTestCase exe '!sc --line ' . line('.') . ' ' . expand('%:p')

  nnoremap -tf :RunTestFile<CR>
  nnoremap -tc :RunTestCase<CR>
endfunction

au BufRead,BufNewFile *_spec.rb,*.feature call s:SetupSpeCuke()
