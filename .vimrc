execute pathogen#infect()

" General settings
syntax on
filetype plugin indent on
set number
set laststatus=2

" Theme
if $TERM == "xterm-256color"
  set t_Co=256
endif
"colorscheme jellybeans
"let g:jellybeans_use_lowcolor_black = 0

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:SuperTabDefaultCompletionType = "context"

" Keybindings
nmap <F3> :NERDTreeToggle<CR>
nmap s <Plug>(easymotion-s)
