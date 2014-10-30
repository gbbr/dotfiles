execute pathogen#infect()

" General settings
syntax on
filetype plugin indent on
set cursorline
set number
set laststatus=2
set tabstop=4
let mapleader = ","
autocmd BufEnter * set listchars=tab:▸\ ,eol:¬

" Colorscheme
colorscheme apprentice

" Autocomplete
set completeopt=longest,menuone

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:SuperTabDefaultCompletionType = "context"

" Keybindings
nmap <F3> :NERDTreeToggle<CR>
nmap s <Plug>(easymotion-s)
nmap <leader>l :set list!<CR>
