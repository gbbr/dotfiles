set nocompatible

" --------------------------------------------------------------
"  Plugins
" --------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'dgryski/vim-godef'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'jelera/vim-javascript-syntax'

call vundle#end()
" --------------------------------------------------------------

let mapleader = ","

set nobackup
set noswapfile
set vb

" Ack searches
noremap <leader>sg :Ack --go 
noremap <leader>sj :Ack --jsx 
noremap <leader>sc :Ack --scss 
noremap <leader>sh :Ack --html 

" Auto-indentation 
filetype indent plugin on

" Auto-closing braces
inoremap {<CR>  {<CR>}<Esc>O
inoremap (<CR>  (<CR>)<Esc>O

" Resize splits
noremap <Right> <C-w>10<
noremap <Left> <C-w>10>
noremap <Up> <C-w>4+
noremap <Down> <C-w>4-

" Navigate splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Vertical split always right
set splitright
set splitbelow

" Local CD
noremap <leader>c :lcd %:p:h<CR>

" Share OS clipboard
set clipboard=unnamed

" Theme
syntax on
set title
set cursorline
set number
set scrolloff=2
set nowrap
set nostartofline
colorscheme mono

" Toggle spell checker
nnoremap <leader>s :set spell!<cr>

" Save on Enter
nnoremap <cr> :w<cr>

" Columns and wrapping
nnoremap <leader>w :set nowrap!<cr>

" Toggle vertical bar at 80 columns
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
nnoremap <silent> <Leader>h :set hlsearch!<CR>

" Tabs and spaces
set listchars=tab:\|-\,eol:¬,trail:·,nbsp:·
set tabstop=5
set shiftwidth=5
nmap <leader>l :set list!<CR>

" Show current file as HTML
map <Leader><C-h> :TOhtml<CR>:w<cr>:!open %<CR>:q<CR>

" --------------------------------------------------------------
"  GUI Configuration
" --------------------------------------------------------------
set guifont=Consolas:h15
set linespace=1
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L


" --------------------------------------------------------------
"  Plugin Configuration
" --------------------------------------------------------------

" neocomplete.vim
set completeopt=longest,menuone
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" git-gutter disable
let g:gitgutter_map_keys = 0

" vim-easymotion
nmap s <Plug>(easymotion-s)

" nerdtree
let NERDTreeQuitOnOpen=1
let g:NERDTreeMapOpenSplit="<c-x>"
let g:NERDTreeMapOpenVSplit="<c-v>"
let g:NERDTreeMapOpenInTab="<c-t>"
nmap <leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" ctrlp.vim
nmap <Leader>m :CtrlPMRU<CR>

" emmet.vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-t>'
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

" --------------------------------------------------------------
"  JavaScript
" --------------------------------------------------------------
let javascript_enable_domhtmlcss = 1

" Indentation
" autocmd Filetype javascript setlocal ts=3
" autocmd Filetype javascript setlocal expandtab
au FileType javascript nmap <leader>t :!jest<cr>

" Use javascript highlighting for JSON
autocmd BufEnter *.jsx set filetype=javascript
autocmd BufEnter *.json set filetype=javascript
