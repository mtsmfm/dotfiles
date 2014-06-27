if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

NeoBundle 'gmarik/vundle'

" colorschema
NeoBundle 'xoria256.vim'
NeoBundle 'pyte'
NeoBundle 'Solarized'
NeoBundle 'aereal/vim-magica-colors'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle '29decibel/codeschool-vim-theme'

NeoBundle 'vimwiki'
NeoBundle 'Rename'
NeoBundle 'taglist.vim'
NeoBundle 'repeat.vim'
NeoBundle 'matchit.zip'
NeoBundle 'SuperTab'

NeoBundle 'scrooloose/syntastic'

NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'ecomba/vim-ruby-refactoring'
NeoBundle 'nelstrom/vim-textobj-rubyblock'

NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-fold'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-lastpat'

NeoBundle 'Shougo/vimfiler'

NeoBundle 'h1mesuke/vim-alignta'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'basyura/unite-rails'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'mtsmfm/unite-turnip'

NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'mtsmfm/vim-surround'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'csexton/trailertrash.vim'

NeoBundle 'kchmck/vim-coffee-script'

NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'

NeoBundle 'hail2u/vim-css3-syntax'

NeoBundle 'maxbrunsfeld/vim-yankstack'

NeoBundle 'slim-template/vim-slim'

NeoBundle 'scrooloose/nerdtree'

NeoBundle 'mtsmfm/vim-rspec-focus'

NeoBundle 'rhysd/clever-f.vim'
NeoBundle 'coderifous/textobj-word-column.vim'
NeoBundle 'mattn/emmet-vim'

NeoBundle 'jgdavey/vim-blockle'

NeoBundle 'mtsmfm/vim-cursorline-boost'

NeoBundle 'rking/ag.vim'

filetype plugin indent on
syntax enable

set term=screen-256color
set t_Co=256
set background=dark
let g:solarized_termtrans=1
colorscheme solarized
hi Pmenu ctermbg=4

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
cnoremap <C-x> <C-r>=expand('%:p:h')<CR>/
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'

" <Leader>
inoremap <Leader>date <C-R>=strftime('%Y/%m/%d(%a)')<CR>
inoremap <Leader>time <C-R>=strftime('%H:%M:%S')<CR>

" unite.vim
nnoremap <silent> ,uf :<C-u>Unite file file/new<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,uo :<C-u>Unite outline<CR>
nnoremap <silent> ,ua :<C-u>Unite alignta<CR>
nnoremap <silent> ,uh :<C-u>Unite help<CR>
nnoremap <silent> ,ut :<C-u>Unite turnip<CR>

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

augroup MyAutoCmd
  autocmd!

  "自動的に QuickFix リストを表示する
  autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin

  autocmd BufWritePre * :Trim
augroup END

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

highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE
