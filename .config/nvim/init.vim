" vim:fdm=marker
" init: mkdir -p ~/.nvim/repos/github.com/Shougo/ && git clone https://github.com/Shougo/dein.vim.git ~/.nvim/repos/github.com/Shougo/dein.vim
" mkdir -p ~/.nvim/tmp/undo && mkdir ~/.nvim/tmp/backup && mkdir ~/.nvim/tmp/swap
" :call dein#install()

set runtimepath+=~/.nvim/repos/github.com/Shougo/dein.vim
set runtimepath+=~/.nvim/
if dein#load_state('~/.nvim/')
  call dein#begin('~/.nvim/')"
  " Let dein manage dein
  " Required:
  call dein#add('~/.nvim/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
 set nocompatible
endif

" Enable to see non-printable chars
" set list

set autoread
set updatetime=500
au CursorHold * silent! checktime
au FocusLost * silent! wa
"au FileChangedShell * checktime

set virtualedit=onemore
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set incsearch
set hlsearch
set smartcase
set ignorecase
set backspace=indent,eol,start

map <silent> <C-s> :wall<cr>
imap <silent> <C-s> <esc>:wall<cr>

set timeout timeoutlen=150 ttimeoutlen=50
set showcmd

" swap buffers
nmap <C-e> :e#<CR>
nnoremap <space> i <Esc>

let mapleader = "\\"

noremap <silent> <Home> ^
imap <silent> <Home> <C-O><Home>
set foldmethod=syntax
set foldlevelstart=100

au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *.ts set filetype=typescript
au BufRead,BufNewFile *.handlebars set filetype=html

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

call dein#add('digitaltoad/vim-pug')
call dein#add('slim-template/vim-slim')
call dein#add('kchmck/vim-coffee-script')

call dein#add('mileszs/ack.vim')
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.whitespace = "!"
call dein#add('bling/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

"call dein#add('mileszs/ack.vim')
call dein#add('nelstrom/vim-visual-star-search')
call dein#add('junegunn/vim-easy-align')
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/nerdcommenter')
" vue support in nerdcommenter
let g:ft = ''
fu! NERDCommenter_before()
    if &ft == 'vue'
        let g:ft = 'vue'
        let stack = synstack(line('.'), col('.'))
        if len(stack) > 0
            let syn = synIDattr((stack)[0], 'name')
            if len(syn) > 0
                let syn = tolower(syn)
                exe 'setf '.syn
            endif
        endif
    endif
endfu
fu! NERDCommenter_after()
    if g:ft == 'vue'
        setf vue
        let g:ft = ''
    endif
endfu

call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-unimpaired')
call dein#add('vim-ruby/vim-ruby')
call dein#add('tpope/vim-rails')
let g:rails_no_abbreviations = 1

"call dein#add('w0rp/ale')
" for ale
" let g:ale_go_staticcheck_lint_package = 1
" let g:ale_linters = {
" "\   'ruby': ['brakeman', 'rails_best_practices', 'reek', 'ruby'],
" "\}
autocmd BufRead,BufNewFile * setlocal signcolumn=yes


call dein#add('tpope/vim-fugitive')
"call dein#add('airblade/vim-gitgutter')
"call dein#add('gregsexton/gitv')

call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('leafgarland/typescript-vim')
call dein#add('posva/vim-vue')
call dein#add('godlygeek/tabular')

call dein#add('Raimondi/delimitMate')
call dein#add('terryma/vim-multiple-cursors')

call dein#add('moll/vim-node')
call dein#add('mhinz/vim-startify')

call dein#add('bfredl/nvim-miniyank')
map <Leader>y :Denite miniyank<CR>

call dein#add('Xuyuanp/nerdtree-git-plugin')

call dein#add('mbbill/undotree')
nnoremap <Leader>u :UndotreeToggle<cr>
" causes error
"call dein#add('tpope/vim-eunuch')

call dein#add('bronson/vim-trailing-whitespace')

"call dein#add('mattn/webapi-vim')

"NeoBundle  'luochen1990/rainbow'
"let g:rainbow_active = 0

"NeoBundle 'thinca/vim-quickrun'

let g:go_fmt_command = "goimports"
"let g:go_auto_type_info = 1
let g:go_info_mode = 'guru'

call dein#add('fatih/vim-go')
"call dein#add('majutsushi/tagbar')
"nmap <F8> :TagbarToggle<CR>

"NeoBundle  'Yggdroot/indentLine'
call dein#add('nathanaelkane/vim-indent-guides')

"NeoBundle  'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"NeoBundle  'junegunn/fzf.vim'

"NeoBundle 'stefanoverna/vim-i18n'
"vmap <Leader>z :call I18nTranslateString()<CR>
"vmap <Leader>dt :call I18nDisplayTranslation()<CR>

" pacin python-neovim 
" :UpdateRemotePlugins
" restart neovim

call dein#add('Shougo/denite.nvim')
call denite#custom#var('file/rec', 'command',
	\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
map <C-p> :Denite file/rec -start-filter -post-action=open<CR>

function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
endfunction

function! s:denite_filter_my_settings() abort
  inoremap <silent><buffer> <Up> <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
  inoremap <silent><buffer> <Down>  <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
  inoremap <silent><buffer> <Esc> <Esc><C-w>q<C-w>q
  imap <silent><buffer> <CR> <Esc><C-w><CR><CR><CR>
  inoremap <silent><buffer> <C-p> <C-Up>
  inoremap <silent><buffer> <C-n> <C-Down>
endfunction

augroup DENITE
    autocmd!
    autocmd FileType denite call s:denite_my_settings()
    autocmd FileType denite-filter call s:denite_filter_my_settings()
augroup end

map <silent> <C-p> :Denite file/rec -auto-resize -smartcase -start-filter<CR>



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

" Better split navigation
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


" Better page up-down
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>


"Colors {{{
call dein#add('nonsense/tomorrow-night-vim-theme')
call dein#add('glebtv/onehalf')
"}}}

filetype plugin indent on


"Basic" {{{
  color Tomorrow-Night
  "color onehalflight
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
