" vim:fdm=marker
" init: mkdir -p ~/.nvim/repos/github.com/Shougo/ && git clone https://github.com/Shougo/dein.vim.git ~/.nvim/repos/github.com/Shougo/dein.vim
" mkdir -p ~/.nvim/tmp/undo && mkdir ~/.nvim/tmp/backup && mkdir ~/.nvim/tmp/swap
" :call dein#install()

  set runtimepath+=~/.nvim/repos/github.com/Shougo/dein.vim
  set runtimepath+=~/.nvim/
  if dein#load_state('~/.nvim/repos/')
    call dein#begin('~/.nvim/repos/')"
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

call dein#add('slim-template/vim-slim')
call dein#add('kchmck/vim-coffee-script')
call dein#add('rking/ag.vim')

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.whitespace = "!"
call dein#add('bling/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

call dein#add('mileszs/ack.vim')
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

call dein#add('w0rp/ale')
" for ale
autocmd BufRead,BufNewFile * setlocal signcolumn=yes


call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('gregsexton/gitv')

call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('leafgarland/typescript-vim')
call dein#add('posva/vim-vue')
call dein#add('godlygeek/tabular')

call dein#add('Raimondi/delimitMate')
call dein#add('terryma/vim-multiple-cursors')

call dein#add('moll/vim-node')
call dein#add('mhinz/vim-startify')

call dein#add('Shougo/denite.nvim')
map <Leader>d :Denite<CR>

call dein#add('bfredl/nvim-miniyank')
map <Leader>y :Denite miniyank<CR>

call dein#add('Xuyuanp/nerdtree-git-plugin')

call dein#add('mbbill/undotree')
nnoremap <Leader>u :UndotreeToggle<cr>
call dein#add('tpope/vim-eunuch')

call dein#add('bronson/vim-trailing-whitespace')

"call dein#add('mattn/webapi-vim')

"NeoBundle  'luochen1990/rainbow'
"let g:rainbow_active = 0

"NeoBundle 'thinca/vim-quickrun'

let g:go_fmt_command = "goimports"
call dein#add('fatih/vim-go')

"NeoBundle  'Yggdroot/indentLine'
call dein#add('nathanaelkane/vim-indent-guides')

"NeoBundle  'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"NeoBundle  'junegunn/fzf.vim'

"NeoBundle 'stefanoverna/vim-i18n'
"vmap <Leader>z :call I18nTranslateString()<CR>
"vmap <Leader>dt :call I18nDisplayTranslation()<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|public|log|bower_components|node_modules|coverage|tmp)$',
  \ 'file': '\v\.(exe|so|dll|log|pid)$',
  \ }
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_mruf_relative = 1
"
"https://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesnt-work-to-ignore-some-folders/22784889#22784889
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"if executable('ag')
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_user_command = 'cd %s && ag . -l --nocolor -g ""'
"endif

call dein#add('ctrlpvim/ctrlp.vim')

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
"}}}

filetype plugin indent on


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
