" vimrc

set nocompatible
set re=1
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

" put a new line before or after to this line
nnoremap <S-CR> i<CR><ESC>

map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>

map <c-k> <C-U>
map <c-j> <C-D>
imap <c-k> <C-O><C-U>
imap <c-j> <C-O><C-D>

set nostartofline

set foldlevelstart=20
set foldmethod=indent
set foldcolumn=3

"setlocal foldmethod=expr
"setlocal foldexpr=(getline(v:lnum)=~'^$')?-1:((indent(v:lnum)<indent(v:lnum+1))?('>'.indent(v:lnum+1)):indent(v:lnum))
"set foldtext=getline(v:foldstart)
set fillchars=fold:\ "(there's a space after that \)
" highlight Folded ctermfg=DarkGreen ctermbg=Black
nnoremap <S-Left> zo
inoremap <S-Left> <C-O>zo
nnoremap <S-Right> zc
inoremap <S-Right> <C-O>zc
" Shift-Up Shift-Down (incase Shift is held while browsing folds)
nmap <S-Up> <Up>
nmap <S-Down> <Down>
imap <S-Up> <Up>
imap <S-Down> <Down>
vmap <S-Up> <Up>
vmap <S-Down> <Down>

"autocmd BufWinLeave *.rb mkview
"autocmd BufWinEnter *.rb silent loadview

"autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" reverse J command
"nnoremap <C-J> vaW<Esc>Bi<CR><Esc>k:s/\s\+$//<CR>$

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"Bundle 'Valloric/YouCompleteMe'
"let g:EclimCompletionMethod = 'omnifunc'

" very SLOW
"Bundle "ervandew/supertab"

"Bundle 'jeetsukumaran/vim-buffergator'
" Bundle 'jlanzarotta/bufexplorer'

"let g:bufferline_active_buffer_left = ''
"let g:bufferline_active_buffer_right = ''
"let g:bufferline_echo = 0
"Bundle 'bling/vim-bufferline'

"Bundle 'bling/vim-airline'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"Bundle 'paranoida/vim-airlineish'
"let g:airline_theme='solarized'

Bundle 'stefanoverna/vim-i18n'
vmap <Leader>t :call I18nTranslateString()<CR>

"Bundle 'airblade/vim-gitgutter'
"Bundle 'tpope/vim-fugitive'
"nmap <leader>g :execute '! cd ' . getcwd() . ' && gt<space>

"function! CommitAndPush(args)
  "let l:message = a:args . join(a:000, ' ')
  "exe ":Git add ."
  "exe ":Git commit -am '" . l:message . " ' "
  "exe ":Git push"
"endfunction
"command! -bang -nargs=* Gt call CommitAndPush(<q-args>)
"nnoremap <leader>g :Gt<space>

"function! PushToCurrentBranch()
  "exe ":Gadd " . getcwd()
  "exe ":Gcommit -a"
  "exe ":Git push"
"endfunction

" Map gwp keys to call the function
"nnoremap <leader>g :call PushToCurrentBranch()<CR>

"Bundle 'AndrewRadev/switch.vim'
"nnoremap - :Switch<cr>

" Bundle 'mileszs/ack.vim'
"Bundle 'glebtv/ack.vim'
" nnoremap <leader>a :Ack!<space>

" Bundle 'dyng/ctrlsf.vim'
" let g:ctrlsf_ackprg = 'ack'
" nnoremap <leader>x :CtrlSF<space>

let g:aghighlight=1
Bundle 'rking/ag.vim'
nnoremap <leader>a :Ag<space>

Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

"Bundle 'Lokaltog/vim-easymotion'
"let g:EasyMotion_leader_key = '<Leader>'

" Bundle 'goldfeld/vim-seek'

Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
"Bundle 'tpope/vim-vinegar'

let NERDTreeMinimalUI=1
Bundle 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
"map <leader>n :NERDTreeToggle<CR>
map <leader>n :execute 'NERDTreeToggle ' . getcwd()<CR>
"Bundle 'tyok/nerdtree-ack'

let g:multi_cursor_use_default_mapping=0
Bundle 'terryma/vim-multiple-cursors'
" Default mapping
let g:multi_cursor_next_key='<C-q>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" let g:multi_cursor_start_key='<F10>'
" Bundle 'terryma/vim-multiple-cursors'

" Easy splitted window navigation
"noremap <C-h>  <C-w>h
"noremap <C-j>  <C-w>j
"noremap <C-k>  <C-w>k
"noremap <C-l>  <C-w>l

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

" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L
set guioptions-=T

set guioptions-=m
set guioptions-=M 

Bundle 'maxbrunsfeld/vim-yankstack'
map <leader>y :Yanks<CR>

"Bundle 'vim-scripts/YankRing.vim'
"let g:yankring_window_use_horiz = 0
"let g:yankring_window_use_right = 1
"let g:yankring_replace_n_pkey = '<leader>p'
"let g:yankring_replace_n_nkey = '<leader>o'
"let g:yankring_del_v_key = '<M-d>'
"nmap <M-p> :YRReplace -1, ''P''<CR>
"nmap <M-o> :YRReplace 1, ''P''<CR>

"let g:yankring_history_dir = '~/.vim/tmp/'
"map <leader>y :YRShow<CR>
"map! <F12>y :YRShow<CR>

nnoremap <M-s> "_diwP
vnoremap <M-s> "_dP
nnoremap <M-a> vw"_dP

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|public|log|_etc|node_modules|bower_components|coverage)$',
  \ 'file': '\v\.(exe|so|dll|log|pid)$',
  \ }

let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_mruf_relative = 1
"let g:ctrlp_prompt_mappings = { 'ToggleMRURelative()': ['<F2>'] }
"let g:ctrlp_extensions = ['funky']
"Bundle 'tacahiroy/ctrlp-funky'
Bundle 'kien/ctrlp.vim'
"nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
"nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

map <c-space> :CtrlPMRU<CR>
map <leader>m :CtrlPMixed<CR>
map <leader>b :CtrlPBuffer<CR>


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

"function! CtrlSpMark()
  "if expand('%:t') =~ '__CS__'
    "return ctrlspace#statusline_mode_segment()
  "else
    "return ''
  "endif
"endfunction

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


nmap <C-e> :e#<CR>

" delete word without putting it to buffer
map <F2> "_dw

" delete line without putting it to buffer
map <F3> "_dd

" delete without putting to buffer 
map <F4> "_d
map <leader>d "_d
"map R "_d

set shortmess+=filmnrxoOtT

Bundle 'scrooloose/nerdcommenter'
map <silent><F6> :call NERDComment(0, "invert")<cr>
map <silent><leader>r :call NERDComment(0, "invert")<cr>

map <leader>v :e ~/.vimrc<cr>
map <leader>7 :e ~/.i3/config<cr>

" delete windows \r newlines
map <F7> :%s/\r//g<cr>

let g:undotree_SetFocusWhenToggle=1
Bundle 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<CR>

"noremap <F9> :w<CR>

" remove unwanted spaces
nnoremap <silent> <F10> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Bundle 'chrisbra/csv.vim'

"let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby'], 'passive_filetypes': ['html', 'css', 'slim'] }
"Bundle 'scrooloose/syntastic'

hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare

autocmd FileType gitcommit set tw=68 
autocmd FileType gitcommit setlocal foldmethod=manual

"Bundle 'mhinz/vim-signify'

"set regexpengine=1
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
"Bundle 'tpope/vim-bundler'
"Bundle 'tpope/vim-rvm'

" autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et
" autocmd FileType ruby,eruby,yaml setlocal foldmethod=syntax
" autocmd User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

au BufRead,BufNewFile *.thor set filetype=ruby

Bundle 'glebtv/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'slim-template/vim-slim'

"Bundle 'digitaltoad/vim-jade'
"Bundle 'wavded/vim-stylus'

"Bundle 'benmills/vimux'
"Bundle 'skalnik/vim-vroom'
"let g:vroom_use_vimux = "1"
"let g:vroom_use_colors = "1"
"let g:vroom_use_spring = "1"
"let g:vroom_write_all = "1"
"let g:VimuxUseNearestPane = 1
"let g:VimuxHeight = "100"

" au BufNewFile,BufReadPost *.sass setl foldmethod=indent

set shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
" au BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab foldmethod=indent
" au BufNewFile,BufReadPost *.skim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab foldmethod=indent
autocmd BufNewFile,BufRead *.skim set syntax=slim|set ft=slim
autocmd BufNewFile,BufRead *.slim set syntax=slim|set ft=slim

" This needs to be installed but not loaded
" Bundle 'lepture/vim-css'
" Bundle 'JulesWang/css.vim'

Bundle 'kchmck/vim-coffee-script'
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent

" au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Bundle 'alfredodeza/jacinto.vim'
" au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
" au BufNewFile,BufReadPost *.coffee setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" very buggy
"Bundle 'ap/vim-css-color'

filetype plugin indent on

"Bundle 'tomasr/molokai'
"colorscheme molokai

Bundle 'altercation/vim-colors-solarized'
set background=dark
colorscheme solarized

" hi StatusLine guifg=#fff guibg=#4B8988
" hi StatusLineNC guifg=#999 guibg=#252525

syntax on
set guifont=PragmataPro\ 10.5

" Set 5 lines to the cursor - when moving vertically
set scrolloff=0

" It defines where to look for the buffer user demanding (current window, all
" windows in other tabs, or now nhere, i.e. open file from scratch every time) and
" how to open the buffer (in the new split, tab, or in the current window).

" This orders Vim to open the buffer.
set switchbuf=useopen

" Highlight VCS conflict markers
" match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" nmap <silent> <leader>hh :set invhlsearch<CR>
" nmap <silent> <leader>ll :set invlist<CR>
" nmap <silent> <leader>nn :set invnumber<CR>
" nmap <silent> <leader>pp :set invpaste<CR>
" nmap <silent> <leader>ii :set invrelativenumber<CR>

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

Bundle 'lyokha/vim-xkbswitch'
let g:XkbSwitchEnabled = 1
"let g:XkbSwitchIMappings = ['ru']
let g:XkbSwitchLib = '/usr/lib/libxkbswitch.so'

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Settings {{{
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


" SLOW SCROLL!
set cursorline
"set relativenumber

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

" Save when losing focus
au FocusLost    * :silent! wall

" Search {{{
Bundle 'thinca/vim-visualstar'

set ignorecase
set smartcase
set showmatch
set gdefault
set hlsearch

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

" }}}

" Begining & End of line in Normal mode
noremap H ^
noremap L g_

" more natural movement with wrap on
" nnoremap j gj
" nnoremap k gk
" vnoremap j gj
" vnoremap k gk

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Bubbling lines
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" }}}

 " _ Vim {{{
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}

noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

nnoremap <space> i <Esc>
nnoremap <bs> i<bs><Esc>l

Bundle 'artnez/vim-wipeout'

"Bundle 'jeetsukumaran/vim-markology'
"hi MarkologyHLl ctermfg=green ctermbg=black cterm=bold guifg=green guibg=#002B36
"hi MarkologyHLLine cterm=underline gui=undercurl guisp=#007777
"hi MarkologyHLu ctermfg=green ctermbg=black cterm=bold guifg=green guibg=#002B36
"hi MarkologyHLo ctermfg=green ctermbg=black cterm=bold guifg=green guibg=#002B36
"hi MarkologyHLm ctermfg=green ctermbg=black cterm=bold guifg=green guibg=#002B36
hi SignColumn ctermfg=green ctermbg=black cterm=bold guifg=green guibg=#002B36

"function! DelEmptyLineBelow()
  "if line(".") == line("$")
    "return
  "end
  "let l:line = getline(line(".") + 1)
  "if l:line =~ '^\s*$'
    "let l:colsave = col(".")
    ".+1d
    "''
    "call cursor(line("."), l:colsave)
  "end
"endfunction

"function! DelEmptyLineAbove()
  "if line(".") == 1
    "return
  "end
  "let l:line = getline(line(".") - 1)
  "if l:line =~ '^\s*$'
    "let l:colsave = col(".")
    ".-1d
    "silent normal! <C-y>
    "call cursor(line("."), l:colsave)
  "end
"endfunction

"function! DelLineBelow()
  "if line(".") == line("$")
    "return
  "end
  "let l:line = getline(line(".") + 1)
  "let l:colsave = col(".")
  ".+1d
  "''
  "call cursor(line("."), l:colsave)
"endfunction

"function! DelLineAbove()
  "if line(".") == 1
    "return
  "end
  "let l:line = getline(line(".") - 1)
  "let l:colsave = col(".")
  ".-1d
  "silent normal! <C-y>
  "call cursor(line("."), l:colsave)
"endfunction


"noremap <silent> <c-[> :call DelEmptyLineAbove()<CR>
"noremap <silent> <c-]> :call DelEmptyLineBelow()<CR>

"noremap <silent> <c-m-]> :call DelLineBelow()<CR>
"noremap <silent> <c-m-[> :call DelLineAbove()<CR>

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

"nmap <F14> <C-w>q
"nmap <F13> <C-w>v
"nmap <F15> <C-w>s


nmap <m-x> <C-w>q
nmap <m-c> <C-w>q
nmap <m-'> <C-w>v
nmap <m-/> <C-w>s


"Bundle 'mhinz/vim-startify'
"let g:startify_change_to_vcs_root = 1
"let g:startify_bookmarks = [ '~/.vimrc', '/data/ml', '/data/ml_node' ]
"autocmd FileType startify setlocal buftype=

" Buggy shit (resizes splits on it's own)
" Bundle 'fholgado/minibufexpl.vim'
" map <F12> :MBEToggle<cr>

"hi FoldColumn guifg=#444444 guibg=#1B1D1E
"hi Folded guifg=#999999 guibg=#444444
"hi VertSplit guifg=#999999 guibg=#333333


map <leader>q :ZoomWin<cr>

"Bundle 'xolox/vim-misc'
"Bundle 'xolox/vim-session'

"let g:session_autosave='no'
"let g:session_autoload='no'

"Bundle 'zoeesilcock/vim-caniuse'

"Bundle 'AndrewRadev/splitjoin.vim'
"nmap sj :SplitjoinSplit<cr>
"nmap sk :SplitjoinJoin<cr>

"Bundle 'szw/vim-ctrlspace'
"nnoremap <M-t> :tabnew<CR>
"nnoremap <C-Left> :tabprev<CR>
"nnoremap <C-Right> :tabnext<CR>
"nnoremap <C-c> :tabclose<CR>

"set showtabline=0
"let g:ctrlspace_use_tabline=1

"Bundle 'othree/eregex.vim'
"nnoremap <leader>/ :call eregex#toggle()<CR>

"Bundle 'saihoooooooo/glowshi-ft.vim'

