execute pathogen#infect()
let mapleader = ","

" Auto-indentation 
filetype indent plugin on

" Auto-closing braces
inoremap {<CR>  {<CR>}<Esc>O

" Resize splits
noremap <Right> <C-w>10<
noremap <Left> <C-w>10>
noremap <Up> <C-w>4+
noremap <Down> <C-w>4-

" Vertical split always right
set splitright
set splitbelow

" Copy to clipboard
vnoremap <C-c> "*y
vnoremap <C-x> "*d

" Theme
syntax on
colorscheme apprentice
set cursorline
set number
set scrolloff=1
set nowrap
nnoremap <leader>s :set spell!<cr>

" Save on <leader>w
nnoremap <leader><Space> :w<cr>

" Columns and wrapping
nnoremap <silent> <leader>w :set nowrap!<cr>
nnoremap <silent> <leader>8 :call g:ToggleColorColumn()<CR>
function! g:ToggleColorColumn()
	if &colorcolumn != ''
		setlocal colorcolumn&
	else
		setlocal colorcolumn=80
	endif
endfunction

" Search settings
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <c-h> :set hlsearch!<CR>

" Tabs and spaces
nmap <leader>l :set list!<CR>
set listchars=tab:\|-\,eol:¬,trail:·,nbsp:·
set tabstop=4
set shiftwidth=4

" File types
autocmd BufEnter *.json set filetype=javascript

" Show current file as HTML (to paste into Keynote)
nmap <Leader>h :TOhtml<CR>:w<cr>:!open %<CR>:q<CR>

" --------------------------------------------------------------
"  Plugins
" --------------------------------------------------------------

" SuperTab / NeoComplete
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

" CtrlP
nmap <Leader>m :CtrlPMRU<CR>

" --------------------------------------------------------------
"  Go Specific
" --------------------------------------------------------------
let g:godef_split=3 " 0 - current window, 2 - tab, 3 - vertical split
let g:godef_same_file_in_same_window=1
let g:go_fmt_command = "goimports"

au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
