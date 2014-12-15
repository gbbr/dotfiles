set nocompatible

" --------------------------------------------------------------
"  Plugins
" --------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/Tagbar'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'cespare/vim-go-templates'
Plugin 'dgryski/vim-godef'
Plugin 'pangloss/vim-javascript'

call vundle#end()
" --------------------------------------------------------------

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
colorscheme apprentice
nnoremap <leader>s :set spell!<cr>

" Save on <leader>w
nnoremap <cr> :w<cr>

" Columns and wrapping
nnoremap <leader>w :set nowrap!<cr>
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
nnoremap <silent> <C-h> :set hlsearch!<CR>

" Tabs and spaces
set listchars=tab:\|-\,eol:¬,trail:·,nbsp:·
set tabstop=4
set shiftwidth=4
nmap <leader>l :set list!<CR>

" Show current file as HTML
map <Leader>h :TOhtml<CR>:w<cr>:!open %<CR>:q<CR>

" --------------------------------------------------------------
"  Plugin Configuration
" --------------------------------------------------------------

" neocomplete.vim
set completeopt=longest,menuone
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" vim-easymotion
nmap s <Plug>(easymotion-s)

" nerdtree
let NERDTreeQuitOnOpen=1
nmap <leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" ctrlp.vim
nmap <Leader>m :CtrlPMRU<CR>

" ctags
nmap <leader>. :TagbarToggle<CR>
let g:tagbar_ctags_bin='~/ctags-5.8/ctags'
let g:tagbar_width = 60

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

" File types
autocmd BufEnter *.json set filetype=javascript
let g:javascript_conceal = 1
let g:javascript_conceal_function = "ƒ"
