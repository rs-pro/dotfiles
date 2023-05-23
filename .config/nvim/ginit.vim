" Fix key mapping issues for GUI
inoremap <silent> <S-Insert>  <C-R>+
cnoremap <S-Insert> <C-R>+
nnoremap <silent> <C-6> <C-^>

map! <S-Insert> <C-R>+

if exists('g:GuiLoaded')
  " call GuiWindowMaximized(1)
  GuiTabline 0
  GuiPopupmenu 0
  GuiLinespace 2
  Guifont! PragmataProMono Nerd Font:h11
endif

function! DirTitle()
  let &titlestring=fnamemodify(getcwd(), ':t')
  set title
endfunction
