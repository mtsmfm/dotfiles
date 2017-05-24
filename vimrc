"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/unite-outline')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimfiler')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('basyura/unite-rails')
  call dein#add('coderifous/textobj-word-column.vim')
  call dein#add('csexton/trailertrash.vim')
  call dein#add('danro/rename.vim')
  call dein#add('ecomba/vim-ruby-refactoring')
  call dein#add('ervandew/supertab')
  call dein#add('h1mesuke/vim-alignta')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('jgdavey/vim-blockle')
  call dein#add('kana/vim-textobj-fold')
  call dein#add('kana/vim-textobj-indent')
  call dein#add('kana/vim-textobj-lastpat')
  call dein#add('kana/vim-textobj-user')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('maxbrunsfeld/vim-yankstack')
  call dein#add('mtscout6/vim-cjsx')
  call dein#add('mtsmfm/unite-turnip')
  call dein#add('mtsmfm/vim-cursorline-boost')
  call dein#add('mtsmfm/vim-rspec-focus')
  call dein#add('nelstrom/vim-textobj-rubyblock')
  call dein#add('othree/yajs.vim')
  call dein#add('rhysd/clever-f.vim')
  call dein#add('rking/ag.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('scrooloose/syntastic')
  call dein#add('slim-template/vim-slim')
  call dein#add('tmhedberg/matchit')
  call dein#add('tpope/vim-cucumber')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-haml')
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('tsukkee/unite-help')
  call dein#add('tsukkee/unite-tag')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('vim-scripts/taglist.vim')
  call dein#add('vimwiki/vimwiki')
  call dein#add('wakatime/vim-wakatime')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

set term=screen-256color
set t_Co=256
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized
hi Pmenu ctermbg=4
syntax on

set autoread
set hidden
set number
set showmatch
set ttymouse=xterm2
set wildmode=list:longest,list:full

set directory-=.

"backup
set nobackup

"encoding
set enc=utf-8
set fenc=utf-8
set fencs=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos

"Tab
set expandtab
set smartindent
set ts=2 sw=2 sts=2

"search
set nohlsearch
set ignorecase
set smartcase
set incsearch

"statusline
set laststatus=2

set clipboard=unnamedplus


" keymap
nnoremap j gj
nnoremap k gk

nnoremap wh <C-w>h
nnoremap wj <C-w>j
nnoremap wk <C-w>k
nnoremap wl <C-w>l

nnoremap Y y$

nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>

cnoremap <C-a> <Home>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-x> <C-r>=expand('%:p:h')<CR>/
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'

" <Leader>
inoremap <Leader>date <C-R>=strftime('%Y-%m-%d(%a)')<CR>
inoremap <Leader>time <C-R>=strftime('%H:%M:%S')<CR>

" unite.vim
nnoremap <silent> ,uf :<C-u>Unite file file/new<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,uo :<C-u>Unite outline<CR>
nnoremap <silent> ,ua :<C-u>Unite alignta<CR>
nnoremap <silent> ,uh :<C-u>Unite help<CR>
nnoremap <silent> ,ut :<C-u>Unite turnip<CR>
nnoremap <silent> ,ur :<C-u>Unite file_rec<CR>

" unite-alignta
let g:unite_source_alignta_preset_arguments = [
  \ ["Align at ':'", '<<0 \ /1 :'],
  \]

" vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown'}

" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

" show invisibles
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" yankstack
nmap <C-p> <Plug>yankstack_substitute_older_paste

" syntastic
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
" let g:syntastic_ruby_checkers = ['rubocop']

augroup MyAutoCmd
  autocmd!

  "自動的に QuickFix リストを表示する
  autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin

  autocmd BufWritePre * :TrailerTrim
augroup END

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

let g:rails_projections = {
      \ "app/workers/*_worker.rb": {
      \   "command": "worker",
      \   "template":
      \     ["class %SUploader", "end"],
      \   "test": [
      \     "spec/workers/%s_uploader_spec.rb"
      \   ]
      \ }}
