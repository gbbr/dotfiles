set nocompatible

" --------------------------------------------------------------
"  Plugins
" --------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'mileszs/ack.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'airblade/vim-gitgutter'
Plugin 'dgrisky/vim-godef'
Plugin 'fatih/vim-go'
Plugin 'pearofducks/ansible-vim'

call vundle#end()
" --------------------------------------------------------------

let mapleader = ","

set nobackup
set noswapfile
set vb
set autoread

" Ack searches
noremap <leader>sg :Ack! --go 
noremap <leader>sj :Ack! --jsx 
noremap <leader>sc :Ack! --scss 
noremap <leader>sh :Ack! --html 
noremap <leader>sp :Ack! --php 

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
set laststatus=2
set relativenumber
set number
set scrolloff=2
set nowrap
set nostartofline
colorscheme mono

" Toggle spell checker
nnoremap <leader>ss :set spell!<cr>

" Save on Enter
nnoremap <cr> :w<cr>

" Columns and wrapping
nnoremap <leader>w :set nowrap!<cr>

" Toggle vertical bar at 120 columns
nnoremap <silent> <leader>8 :call g:ToggleColorColumn()<CR>
function! g:ToggleColorColumn()
	if &colorcolumn != ''
		setlocal colorcolumn&
	else
		setlocal colorcolumn=120
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

" git-gutter disable mappings
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

nmap T :terminal<CR>

" ctrlp.vim
nmap <Leader>m :CtrlPMRU<CR>
let g:ctrlp_max_files=0

" --------------------------------------------------------------
"  Go Specific
" --------------------------------------------------------------
let g:godef_split=3 " 0 - current window, 2 - tab, 3 - vertical split
let g:godef_same_file_in_same_window=1
let g:go_fmt_command = "goimports"

"au FileType go nmap gd <Plug>(go-def)
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
au FileType javascript nmap <leader>t :!jest<cr>
au FileType javascript setlocal ts=4 sw=4 expandtab
au FileType javascript nmap <leader>cl oconsole.log();<Esc>hi
au FileType javascript nmap <leader>dg odebugger;<Esc>

" Use javascript highlighting for JSON
autocmd BufEnter *.jsx set filetype=javascript
autocmd BufEnter *.json set filetype=javascript

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set exrc " allow local project-specific vimrc
set secure " disable unsafe commands in project-specific configurations

" ---------------------------
"  COC
" --------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
