execute pathogen#infect()
let mapleader = ","

" Auto-indentation 
filetype indent plugin on
let g:go_fmt_command = "goimports"
" Auto-closing braces
inoremap {<CR>  {<CR>}<Esc>O

" Resize splits
noremap <Right> <C-w>10<
noremap <Left> <C-w>10>
noremap <Up> <C-w>4+
noremap <Down> <C-w>4-

" Theme
syntax on
colorscheme apprentice
set cursorline
set number

" Search settings
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <c-h> :set hlsearch!<CR>

" Autocomplete (SuperTab)
set completeopt=longest,menuone
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" StatusBar (Airline)
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" EasyMotion
nmap s <Plug>(easymotion-s)

" NerdTree
nmap <leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=1

" Tabs and spaces
nmap <leader>l :set list!<CR>
set listchars=tab:\|-\,eol:¬,trail:·,nbsp:·
set tabstop=4
set shiftwidth=4

" File types
autocmd BufEnter *.json set filetype=javascript

