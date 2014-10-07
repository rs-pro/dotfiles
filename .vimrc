" vimrc

" Settings {{{
set nocompatible
" set re=1
filetype off

set keymodel-=stopsel
set selectmode=key
set selection=exclusive

"set clipboard=unnamed,unnamedplus
set clipboard=unnamedplus

set virtualedit=onemore
set noequalalways

set t_Co=256
set mouse+=a

if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

set autoread
set backspace=indent,eol,start
set binary
set encoding=utf-8
set hidden
set history=1000
set incsearch
set laststatus=2
set list

" Don't redraw while executing macros
set nolazyredraw

set listchars=nbsp:¬,tab:▸\ ,eol:¬,extends:❯,precedes:❮
" set listchars=eol:¶,tab:>-,extends:»,precedes:«,trail:•
set showbreak=↪

set notimeout
set ttimeout
set ttimeoutlen=10

" _ backups {{{
set undodir=~/.vim/tmp/undo//     " undo files
set undofile
set undolevels=3000
set undoreload=10000
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup
set noswapfile
" _ }}}

set modelines=0
set noeol
set ruler

set cursorline
set number

if executable('/usr/bin/zsh')
  set shell=/usr/bin/zsh
endif
set showcmd

set matchtime=2

set completeopt=longest,menuone,preview

" White characters {{{
set autoindent
set tabstop=2
set softtabstop=2
set textwidth=120
set shiftwidth=2
set expandtab
set formatoptions=qrn1
set colorcolumn=+1
"Bundle 'ntpeters/vim-better-whitespace'
"let g:vimskip_mapbackwardskip = 'C-S'
"Bundle 'jayflo/vim-skip'
" }}}

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc,tmp,*.scssc
set wildmenu

set nostartofline

set foldlevelstart=20
set foldmethod=indent
set foldcolumn=3

set fillchars=fold:\ "(there's a space after that \)

set shiftwidth=2 tabstop=2 softtabstop=2 expandtab

set guifont=PragmataPro\ 10.5

" Set 5 lines to the cursor - when moving vertically
set scrolloff=0

" This orders Vim to open the buffer.
set switchbuf=useopen

set shortmess+=filmnrxoOtT

" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L
set guioptions-=T
set guioptions-=m
set guioptions-=M 

" Search {{{
set ignorecase
set smartcase
set showmatch
set gdefault
set hlsearch
" }}}

" }}}

" Mappings {{{
nmap <C-e> :e#<CR>

" put a new line before or after to this line
nnoremap <S-CR> i<CR><ESC>

map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Begining & End of line in Normal mode
noremap H ^
noremap L g_

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Bubbling lines
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" clear search matching
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Don't jump when using * for search
nnoremap * *<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
"nnoremap g, g,zz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>


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

nnoremap <M-s> "_diwP
vnoremap <M-s> "_dP
nnoremap <M-a> vw"_dP

noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

nnoremap <space> i <Esc>
nnoremap <bs> i<bs><Esc>l

hi SignColumn ctermfg=green ctermbg=black cterm=bold guifg=green guibg=#002B36

vmap <Tab> :><CR>gv
vmap <S-Tab> :<<CR>gv

nmap <Tab> >>
nmap <S-Tab> <<

imap <Tab> <c-t>
imap <S-Tab> <c-d>

nmap <C-Tab> ==

" Yank from current cursor position to end of line
nmap Y y$
vmap Y y$

nmap <m-x> <C-w>q
nmap <m-c> <C-w>q
nmap <m-'> <C-w>v
nmap <m-/> <C-w>s

map <leader>q :ZoomWin<cr>

" delete word without putting it to buffer
map <F2> "_dw
" delete line without putting it to buffer
map <F3> "_dd
" delete without putting to buffer 
map <F4> "_d

" remove unwanted spaces
nnoremap <silent> <F10> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare

map <S-Up> <Up>
map <S-Down> <Down>

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

map <leader>v :e ~/.vimrc<cr>
map <leader>7 :e ~/.i3/config<cr>

" delete windows \r newlines
map <F7> :%s/\r//g<cr>
" }}}

" Vim {{{
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}

" Plugins {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'thinca/vim-visualstar'

Bundle 'stefanoverna/vim-i18n'
vmap <Leader>t :call I18nTranslateString()<CR>

let g:aghighlight=1
Bundle 'rking/ag.vim'
nnoremap <leader>a :Ag<space>

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'

let NERDTreeMinimalUI=1
Bundle 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
map <leader>n :execute 'NERDTreeToggle ' . getcwd()<CR>

let g:multi_cursor_use_default_mapping=0
Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-q>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

Bundle 'maxbrunsfeld/vim-yankstack'
map <leader>y :Yanks<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|public|log|_etc|node_modules|bower_components|coverage)$',
  \ 'file': '\v\.(exe|so|dll|log|pid)$',
  \ }

let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_mruf_relative = 1
Bundle 'kien/ctrlp.vim'
map <c-space> :CtrlPMRU<CR>
map <leader>m :CtrlPMixed<CR>
map <leader>b :CtrlPBuffer<CR>

Bundle 'scrooloose/nerdcommenter'
map <silent><F6> :call NERDComment(0, "invert")<cr>
map <silent><leader>r :call NERDComment(0, "invert")<cr>

let g:undotree_SetFocusWhenToggle=1
Bundle 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<CR>

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'


Bundle 'glebtv/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'slim-template/vim-slim'
Bundle 'kchmck/vim-coffee-script'

Bundle 'lyokha/vim-xkbswitch'
let g:XkbSwitchEnabled = 1
"let g:XkbSwitchIMappings = ['ru']
let g:XkbSwitchLib = '/usr/lib/libxkbswitch.so'

Bundle 'artnez/vim-wipeout'

" }}}

" Color scheme {{{
Bundle 'altercation/vim-colors-solarized'
set background=dark
colorscheme solarized
" }}}

" LightLine {{{
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'filetype' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_function': {
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \   'ctrlspmark': 'CtrlSpMark'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

let g:lightline.component = {
  \ 'filename': '%F'
  \ }

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ fname =~ 'NERD_tree_1' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

Bundle 'itchyny/lightline.vim'

" }}}

" Filetypes, misc {{{
" Save when losing focus
au FocusLost    * :silent! wall
autocmd FileType gitcommit set tw=68 
autocmd FileType gitcommit setlocal foldmethod=manual
au BufRead,BufNewFile *.thor set filetype=ruby
autocmd BufNewFile,BufRead *.skim set syntax=slim|set ft=slim
autocmd BufNewFile,BufRead *.slim set syntax=slim|set ft=slim
autocmd BufNewFile,BufReadPost *.coffee set syntax=coffee ft=coffee fdm=indent

syntax enable
filetype plugin indent on

" }}}
