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

"autocmd InsertEnter * let CursorColumnI = col('.')
"autocmd CursorMovedI * let CursorColumnI = col('.')
"autocmd InsertLeave * call cursor(0, col('.')+1)
"autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

set virtualedit=onemore

set incsearch
set hlsearch
set backspace=indent,eol,start

if &term =~ "xterm.*"
  let &t_ti = &t_ti . "\e[?1004h"
  let &t_te = "\e[?1004l" . &t_te
  nnoremap <silent> <ESC>[O <ESC><ESC>:wall<cr>
  nnoremap <silent> <ESC>[I <ESC>
  imap <silent> <ESC>[O <ESC><ESC>:wall<cr>
  "imap <ESC>[I <ESC>
  "nnoremap <Tab> <Esc>
endif
" au FocusLost    * :silent! wall

set timeout timeoutlen=150 ttimeoutlen=50
set showcmd

" swap buffers
nmap <C-e> :e#<CR>
nnoremap <space> i <Esc>

if &term =~ "xterm\\|rxvt"
  "let &t_SI = "\<Esc>]12;orange\x7"
  "let &t_EI = "\<Esc>]12;red\x7"
  "let &t_SI .= "\<Esc>[4 q"
  "let &t_EI .= "\<Esc>[2 q"
  let &t_SI .= "\<Esc>[5 q"
  let &t_EI .= "\<Esc>[0 q"
endif

set smartcase

let mapleader = "\\"
"let maplocalleader = ","

runtime! python_setup.vim
noremap <silent> OH ^
imap <silent> OH <C-O><Home>
noremap <silent> <Home> ^
imap <silent> <Home> <C-O><Home>

au BufRead,BufNewFile *.thor set filetype=ruby

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

let g:airline_powerline_fonts = 1
NeoBundle    'bling/vim-airline'
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
"NeoBundle    'mileszs/ack.vim'
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

nmap <m-x> <C-w>q
nmap <m-c> <C-w>q
nmap <m-'> <C-w>v
nmap <m-/> <C-w>s

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

map <leader>v :e ~/.nvimrc<cr>
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
