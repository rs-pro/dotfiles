" vimrc

set nocompatible
set re=1
filetype off

set keymodel-=stopsel
set selectmode=key
set selection=exclusive
set clipboard=unnamed,unnamedplus
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
set nostartofline

set foldlevelstart=20
"set foldmethod=syntax
set foldcolumn=3

setlocal foldmethod=expr
setlocal foldexpr=(getline(v:lnum)=~'^$')?-1:((indent(v:lnum)<indent(v:lnum+1))?('>'.indent(v:lnum+1)):indent(v:lnum))
set foldtext=getline(v:foldstart)
set fillchars=fold:\ "(there's a space after that \)
" highlight Folded ctermfg=DarkGreen ctermbg=Black
nnoremap <S-Left> zo
inoremap <S-Left> <C-O>zo
nnoremap <S-Right> zc
inoremap <S-Right> <C-O>zc
" Shift-Up Shift-Down (incase Shift is held while browsing folds)
nmap <S-Up> <Up>
imap <S-Up> <Up>
nmap <S-Down> <Down>
imap <S-Down> <Down>

autocmd BufWinLeave *.rb mkview
autocmd BufWinEnter *.rb silent loadview

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" Bundle 'ervandew/supertab'

" reverse J command
nnoremap <C-J> vaW<Esc>Bi<CR><Esc>k:s/\s\+$//<CR>$

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"Bundle 'Valloric/YouCompleteMe'
"let g:EclimCompletionMethod = 'omnifunc'

Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
" let g:airline_theme='bubblegum'
Bundle 'paranoida/vim-airlineish'
"let g:airline_theme='airlineish'
let g:airline_theme='solarized'

"Bundle 'airblade/vim-gitgutter'
"Bundle 'tpope/vim-fugitive'

"Bundle 'AndrewRadev/switch.vim'
"nnoremap - :Switch<cr>

" Bundle 'mileszs/ack.vim'
Bundle 'glebtv/ack.vim'
nnoremap <leader>a :Ack!<space>

" Bundle 'dyng/ctrlsf.vim'
" let g:ctrlsf_ackprg = 'ack'

" let g:multi_cursor_start_key='<F10>'
" Bundle 'terryma/vim-multiple-cursors'

let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
Bundle 'nathanaelkane/vim-indent-guides'

"let g:airline_powerline_fonts = 1
"Bundle 'bling/vim-airline'

"Bundle 'Lokaltog/vim-easymotion'
"let g:EasyMotion_leader_key = '<Leader>'

" Bundle 'goldfeld/vim-seek'

Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'

Bundle 'scrooloose/nerdtree'
nmap <C-n> :NERDTreeToggle<CR>
Bundle 'tyok/nerdtree-ack'

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

Bundle 'vim-scripts/YankRing.vim'
let g:yankring_window_use_horiz = 0
let g:yankring_window_use_right = 1
let g:yankring_replace_n_pkey = '<leader>p'
let g:yankring_replace_n_nkey = '<leader>o'
let g:yankring_del_v_key = '<M-d>'
nmap <M-p> :YRReplace -1, ''P''<CR>
nmap <M-o> :YRReplace 1, ''P''<CR>

let g:yankring_history_dir = '~/.vim/tmp/'
 nmap <leader>y :YRShow<cr>

nnoremap <M-s> "_diwP
vnoremap <M-s> "_dP

Bundle 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|public|log|_etc|node_modules|bower_components|coverage)$',
  \ 'file': '\v\.(exe|so|dll|log|pid)$',
  \ }

nmap <C-e> :e#<CR>

" delete word without putting it to buffer
map <F2> "_dw

" delete line without putting it to buffer
map <F3> "_dd

" delete without putting to buffer 
map <F4> "_d
map R "_d

set shortmess+=filmnrxoOtT

Bundle 'scrooloose/nerdcommenter'
nmap <F6> :call NERDComment(0, "invert")<cr>
vmap <F6> :call NERDComment(0, "invert")<cr>

" delete windows \r newlines
map <F7> :%s/\r//g<cr>

let g:undotree_SetFocusWhenToggle=1
Bundle 'mbbill/undotree'
nnoremap <F8> :UndotreeToggle<CR>

"noremap <F9> :w<CR>

" remove unwanted spaces
nnoremap <silent> <F10> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Bundle 'chrisbra/csv.vim'

" let g:syntastic_ruby_exec=""
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['ruby'], 'passive_filetypes': ['html', 'css', 'slim'] }
Bundle 'scrooloose/syntastic'

hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare

autocmd FileType gitcommit set tw=68 
autocmd FileType gitcommit setlocal foldmethod=manual

"Bundle 'mhinz/vim-signify'

Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

autocmd FileType ruby,eruby,yaml set tw=80 ai sw=2 sts=2 et
autocmd FileType ruby,eruby,yaml setlocal foldmethod=syntax
autocmd User Rails set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

au BufRead,BufNewFile *.thor set filetype=ruby

Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'slim-template/vim-slim'

Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'

Bundle 'benmills/vimux'
Bundle 'skalnik/vim-vroom'
let g:vroom_use_vimux = "1"
let g:vroom_use_colors = "1"
let g:vroom_use_spring = "1"
let g:vroom_write_all = "1"
let g:VimuxUseNearestPane = 1
let g:VimuxHeight = "100"

au BufNewFile,BufReadPost *.sass setl foldmethod=indent

au BufNewFile,BufReadPost *.html setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au BufNewFile,BufReadPost *.slim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab foldmethod=indent
au BufNewFile,BufReadPost *.skim setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab foldmethod=indent
autocmd BufNewFile,BufRead *.skim set syntax=slim|set ft=slim
autocmd BufNewFile,BufRead *.slim set syntax=slim|set ft=slim

" This needs to be installed but not loaded
" Bundle 'lepture/vim-css'
" Bundle 'JulesWang/css.vim'

Bundle 'kchmck/vim-coffee-script'
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Bundle 'alfredodeza/jacinto.vim'
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab

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

nmap <silent> <leader>hh :set invhlsearch<CR>
nmap <silent> <leader>ll :set invlist<CR>
nmap <silent> <leader>nn :set invnumber<CR>
nmap <silent> <leader>pp :set invpaste<CR>
nmap <silent> <leader>ii :set invrelativenumber<CR>

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

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
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
set relativenumber

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
nnoremap g, g,zz

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

" Easy splitted window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

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

Bundle 'vim-scripts/wipeout'

function! DelEmptyLineBelow()
  if line(".") == line("$")
    return
  end
  let l:line = getline(line(".") + 1)
  if l:line =~ '^\s*$'
    let l:colsave = col(".")
    .+1d
    ''
    call cursor(line("."), l:colsave)
  end
endfunction

function! DelEmptyLineAbove()
  if line(".") == 1
    return
  end
  let l:line = getline(line(".") - 1)
  if l:line =~ '^\s*$'
    let l:colsave = col(".")
    .-1d
    silent normal! <C-y>
    call cursor(line("."), l:colsave)
  end
endfunction

function! DelLineBelow()
  if line(".") == line("$")
    return
  end
  let l:line = getline(line(".") + 1)
  let l:colsave = col(".")
  .+1d
  ''
  call cursor(line("."), l:colsave)
endfunction

function! DelLineAbove()
  if line(".") == 1
    return
  end
  let l:line = getline(line(".") - 1)
  let l:colsave = col(".")
  .-1d
  silent normal! <C-y>
  call cursor(line("."), l:colsave)
endfunction

noremap <silent> <T-]> :call DelEmptyLineBelow()<CR>
noremap <silent> <T-[> :call DelEmptyLineAbove()<CR>

noremap <silent> <C-T-]> :call DelLineBelow()<CR>
noremap <silent> <C-T-[> :call DelLineAbove()<CR>

vmap <Tab> :><CR>gv
vmap <S-Tab> :<<CR>gv

nmap <Tab> >>
nmap <S-Tab> <<

nmap <C-Tab> ==

" Yank from current cursor position to end of line
nmap Y y$
vmap Y y$

nmap <F14> <C-w>q
nmap <F13> <C-w>v
nmap <F15> <C-w>s


"Bundle 'mhinz/vim-startify'
"let g:startify_change_to_vcs_root = 1
"let g:startify_bookmarks = [ '~/.vimrc', '/data/ml', '/data/ml_node' ]
"autocmd FileType startify setlocal buftype=

" Buggy shit (resizes splits on it's own)
" Bundle 'fholgado/minibufexpl.vim'
" map <F12> :MBEToggle<cr>

if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif

"hi FoldColumn guifg=#444444 guibg=#1B1D1E
"hi Folded guifg=#999999 guibg=#444444
"hi VertSplit guifg=#999999 guibg=#333333

