" vim:fdm=marker
"NeoBundle begin" {{{
if has('vim_starting')
 set nocompatible
 set runtimepath+=~/.nvim/bundle/neobundle.vim/
 set runtimepath+=~/.nvim/
endif

call neobundle#begin(expand('~/.nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"}}}

" let g:NERDTreeDirArrows=0

"autocmd InsertEnter * let CursorColumnI = col('.')
"autocmd CursorMovedI * let CursorColumnI = col('.')
"autocmd InsertLeave * call cursor(0, col('.')+1)
"autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

set autoread
set updatetime=500
au CursorHold * silent! checktime
au FocusLost * silent! wa
"au FileChangedShell * checktime

set virtualedit=onemore

set incsearch
set hlsearch
set smartcase
set ignorecase
set backspace=indent,eol,start

"if &term =~ "xterm.*"
  "let &t_ti = &t_ti . "\e[?1004h"
  "let &t_te = "\e[?1004l" . &t_te
  "nnoremap <silent> <ESC>[O <ESC><ESC>:wall<cr>
  "nnoremap <silent> <ESC>[I <ESC>
  "imap <silent> <ESC>[O <ESC><ESC>:wall<cr>
  "imap <ESC>[I <ESC>
  "nnoremap <Tab> <Esc>
"endif
"au FocusLost    * :silent! wall
map <silent> <C-s> :wall<cr>
imap <silent> <C-s> <esc>:wall<cr>

set timeout timeoutlen=150 ttimeoutlen=50
set showcmd

" swap buffers
nmap <C-e> :e#<CR>
nnoremap <space> i <Esc>

"if &term =~ "xterm\\|rxvt"
  "let &t_SI = "\<Esc>]12;orange\x7"
  "let &t_EI = "\<Esc>]12;red\x7"
  "let &t_SI .= "\<Esc>[4 q"
  "let &t_EI .= "\<Esc>[2 q"
  "let &t_SI .= "\<Esc>[5 q"
  "let &t_EI .= "\<Esc>[0 q"
"endif

let mapleader = "\\"
"let maplocalleader = ","

" runtime! python_setup.vim

" noremap <silent> OH ^
" imap <silent> OH <C-O><Home>
noremap <silent> <Home> ^
imap <silent> <Home> <C-O><Home>
set foldmethod=syntax
set foldlevelstart=100

au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.es6 set filetype=ruby

" _ backups {{{
set undodir=~/.nvim/tmp/undo/
set undofile
set undolevels=3000
set undoreload=10000
set backupdir=~/.nvim/tmp/backup/
set directory=~/.nvim/tmp/swap/
set backup
set noswapfile
" _ }}}

NeoBundle 'slim-template/vim-slim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'rking/ag.vim'
" NeoBundle 'wincent/ferret'
"NeoBundle 'wincent/loupe'

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.whitespace = "!"
NeoBundle    'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

"NeoBundle    'Shougo/neosnippet.vim'
"NeoBundle    'Shougo/neosnippet-snippets'
"NeoBundle    'flazz/vim-colorschemes'
"NeoBundle     'airblade/vim-gitgutter'
"NeoBundle     'myusuf3/numbers.vim'
"NeoBundle     'jeetsukumaran/vim-markology'
"NeoBundle     'nonsense/tomorrow-night-vim-theme'
"NeoBundle    'honza/vim-snippets'
"NeoBundle     'benmills/vimux'
"NeoBundle     'vim-scripts/JSON.vim'
"NeoBundle     'godlygeek/tabular'
NeoBundle    'mileszs/ack.vim'
NeoBundle     'nelstrom/vim-visual-star-search'
"NeoBundle     'tpope/vim-vinegar'
NeoBundle     'junegunn/vim-easy-align'
"NeoBundle     'tommcdo/vim-lion'
"NeoBundle     'edkolev/tmuxline.vim'
"NeoBundle    'Shougo/unite.vim'
"NeoBundle    'editorconfig/editorconfig-vim'
" NeoBundle    'scrooloose/syntastic'
"NeoBundle    'jaxbot/semantic-highlight'
NeoBundle    'scrooloose/nerdtree'
NeoBundle    'scrooloose/nerdcommenter'

NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'gregsexton/gitv'

NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'

NeoBundle 'godlygeek/tabular'

"NeoBundle 'Shougo/denite.nvim'
"map <Leader>d :Denite file buffer<CR>

"NeoBundle 'Shougo/unite.vim'
"map <Leader>d :Unite file buffer<CR>
"map <Leader>b :Unite buffer file<CR>

"NeoBundle 'Shougo/neoyank.vim'
"map <Leader>y :Denite history/yank<CR>
"map <Leader>y :Unite history/yank<CR>

NeoBundle 'Raimondi/delimitMate'
NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundle 'ryanoasis/vim-devicons'

NeoBundle 'moll/vim-node'
NeoBundle 'mhinz/vim-startify'
"NeoBundle 'vim-scripts/YankRing.vim'
"map <Leader>y :call YRShow<CR>

NeoBundle 'Xuyuanp/nerdtree-git-plugin'

NeoBundle 'mbbill/undotree'
nnoremap <Leader>u :UndotreeToggle<cr>
NeoBundle 'tpope/vim-eunuch'

NeoBundle 'bronson/vim-trailing-whitespace'

NeoBundle 'mattn/webapi-vim'

NeoBundle  'luochen1990/rainbow'
let g:rainbow_active = 0

NeoBundle 'thinca/vim-quickrun'

let g:go_fmt_command = "goimports"
NeoBundle 'fatih/vim-go'

"NeoBundle  'Yggdroot/indentLine'
NeoBundle 'nathanaelkane/vim-indent-guides'

"NeoBundle  'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"NeoBundle  'junegunn/fzf.vim'

"NeoBundle 'stefanoverna/vim-i18n'
"vmap <Leader>z :call I18nTranslateString()<CR>
"vmap <Leader>dt :call I18nDisplayTranslation()<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|public|log|_etc|node_modules|bower_components|coverage|source_maps|tmp)$',
  \ 'file': '\v\.(exe|so|dll|log|pid)$',
  \ }
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_mruf_relative = 1
NeoBundle 'kien/ctrlp.vim'

set mouse=a
"set unnamedclip
set clipboard+=unnamedplus

vmap <Tab> :><CR>gv
vmap <S-Tab> :<<CR>gv

nmap <Tab> >>
nmap <S-Tab> <<

imap <Tab> <c-t>
imap <S-Tab> <c-d>

nmap <C-Tab> ==

map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

noremap <M-h>  <C-w>h
noremap <M-j>  <C-w>j
noremap <M-k>  <C-w>k
noremap <M-l>  <C-w>l

map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j

imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

nnoremap <M-s> "_diwP
vnoremap <M-s> "_dP
nnoremap <M-a> vw"_dP

nnoremap ó "_diwP
vnoremap ó "_dP
nnoremap á vw"_dP

nmap <m-x> <C-w>q
nmap <m-c> <C-w>q
nmap <m-'> <C-w>v
nmap <m-/> <C-w>s

nmap ø <C-w>q
nmap ã <C-w>q
nmap § <C-w>v
nmap ¯ <C-w>s


" delete word without putting it to buffer
map <F2> "_dw
" delete line without putting it to buffer
map <F3> "_dd
" delete without putting to buffer
map <F4> "_d
map <F7> :%s/\r//g<cr>

" remove unwanted spaces
nnoremap <silent> <F10> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

set shiftwidth=2 tabstop=2 softtabstop=2 expandtab

map <S-Up> <Up>
map <S-Down> <Down>

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w
command! Wa :wa

map <leader>v :e ~/.config/nvim/init.vim<cr>
map <leader>7 :e ~/.i3/config<cr>

"map [5~ <C-U>
"map [6~ <C-D>
"imap [5~ <C-O><C-U>
"imap [6~ <C-O><C-D>

map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>


"Colors {{{
"NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'nonsense/tomorrow-night-vim-theme'
"}}}

" NeoBundle end {{{

" You can specify revision/branch/tag.
"NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

"}}}


"Basic" {{{
  color Tomorrow-Night
  syntax on
"}}}

"Plugin specific" {{{
  "NerdTree" {{{
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    map <leader>n :NERDTreeToggle<CR>
    "map <leader>nf :NERDTreeFind<CR>
  "}}}
  "NerdCommenter {{{
    map <silent><F6> :call NERDComment(0, "invert")<cr>
    map <silent><leader>r :call NERDComment(0, "invert")<cr>
  "}}}
  "Numbers" {{{
    set number
  "}}}
"}}}
