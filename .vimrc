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

"" Python specific indentation settings
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Use javascript highlighting for JSON
autocmd BufEnter *.jsx set filetype=javascript
autocmd BufEnter *.json set filetype=javascript
cnoreabbrev FormatJSON %!python -m json.tool

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set exrc " allow local project-specific vimrc
set secure " disable unsafe commands in project-specific configurations

" ---------------------------
"  COC START
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

highlight CocErrorFloat ctermfg=White guifg=#DDDDDD

" ---------------------------
"  COC END
" --------------------------

" ════════════════════════════════════════════════════════════════════════════
"  :FindAll — multi-term file search with negation, quoting, ripgrep support
"
"  Syntax
"    :FindAll [-c] [-w] [-F] [-g GLOB] <terms …>
"
"  Flags  (mix freely with terms)
"    -c          case-sensitive       (default: case-insensitive)
"    -w          whole-word match
"    -F          fixed strings — terms are literals, not regexes
"    -g GLOB     restrict to files matching GLOB  (e.g. *.py or *.{js,ts})
"
"  Term prefixes
"    word          must be present
"    !word         must be absent
"    "two words"   quoted multi-word term  (single quotes also work)
"    !"bad phrase" quoted absent term
"
"  Examples
"    :FindAll api error !deprecated
"    :FindAll "entry point" !TODO -g *.go -w
"    :FindAll -c MyClass !abstract -g *.java
"    :FindAll !"do not use" helperFn -F
"
"  Uses ripgrep (rg) automatically when available; falls back to grep.
" ════════════════════════════════════════════════════════════════════════════


" ── tokeniser ─────────────────────────────────────────────────────────────────
" Splits the raw arg string into tokens, honouring " and ' quoting.
" A leading '!' is kept on the token so the parser can detect negation.
function! s:FA_Tokenise(raw) abort
    let l:out = []
    let l:i   = 0
    let l:n   = len(a:raw)

    while l:i < l:n
        " skip whitespace
        while l:i < l:n && a:raw[l:i] =~# '\s'
            let l:i += 1
        endwhile
        if l:i >= l:n | break | endif

        " optional '!' negation prefix
        let l:pfx = ''
        if a:raw[l:i] ==# '!'
            let l:pfx = '!'
            let l:i  += 1
            if l:i >= l:n | break | endif
        endif

        " quoted or bare value
        let l:ch = a:raw[l:i]
        if l:ch ==# '"' || l:ch ==# "'"
            let l:q   = l:ch
            let l:i  += 1
            let l:val = ''
            while l:i < l:n && a:raw[l:i] !=# l:q
                let l:val .= a:raw[l:i]
                let l:i   += 1
            endwhile
            let l:i += 1              " consume closing quote
        else
            let l:val = ''
            while l:i < l:n && a:raw[l:i] !~# '\s'
                let l:val .= a:raw[l:i]
                let l:i   += 1
            endwhile
        endif

        if !empty(l:val) | call add(l:out, l:pfx . l:val) | endif
    endwhile

    return l:out
endfunction


" ── argument parser ───────────────────────────────────────────────────────────
" Returns  [ opts{}, terms[] ]
"   opts .case_sensitive / .whole_word / .fixed / .glob
"   terms[n] .term  .negate
function! s:FA_Parse(raw) abort
    let l:tokens = s:FA_Tokenise(a:raw)
    let l:opts   = { 'case_sensitive': 0, 'whole_word': 0, 'fixed': 0, 'glob': '' }
    let l:terms  = []
    let l:i      = 0

    while l:i < len(l:tokens)
        let l:t = l:tokens[l:i]
        if     l:t ==# '-c' | let l:opts.case_sensitive = 1
        elseif l:t ==# '-w' | let l:opts.whole_word     = 1
        elseif l:t ==# '-F' | let l:opts.fixed          = 1
        elseif l:t ==# '-g'
            let l:i += 1
            if l:i < len(l:tokens) | let l:opts.glob = l:tokens[l:i] | endif
        elseif !empty(l:t) && l:t[0] ==# '!'
            call add(l:terms, { 'term': l:t[1:], 'negate': 1 })
        else
            call add(l:terms, { 'term': l:t,     'negate': 0 })
        endif
        let l:i += 1
    endwhile

    return [l:opts, l:terms]
endfunction


" ── shared flag string ────────────────────────────────────────────────────────
" Builds -i / -w / -F / --include flags; -r / -l are added per call site.
function! s:FA_Flags(opts, use_rg) abort
    let l:f = []
    if !a:opts.case_sensitive | call add(l:f, '-i') | endif
    if  a:opts.whole_word     | call add(l:f, '-w') | endif
    if  a:opts.fixed          | call add(l:f, '-F') | endif
    if !empty(a:opts.glob)
        call add(l:f, a:use_rg
            \ ? '-g '        . shellescape(a:opts.glob)
            \ : '--include=' . shellescape(a:opts.glob))
    endif
    return join(l:f, ' ')
endfunction


" ── positive filter ───────────────────────────────────────────────────────────
" Returns files from haystack containing term.
" Empty haystack → seed with a fresh recursive search from '.'.
function! s:FA_Include(term, haystack, flags, use_rg) abort
    if empty(a:haystack)
        let l:cmd = (a:use_rg ? 'rg -l ' : 'grep -rl ')
            \ . a:flags . ' ' . shellescape(a:term) . ' .'
    else
        let l:fargs = join(map(copy(a:haystack), 'shellescape(v:val)'), ' ')
        let l:cmd   = (a:use_rg ? 'rg -l ' : 'grep -l ')
            \ . a:flags . ' ' . shellescape(a:term) . ' ' . l:fargs
    endif
    return systemlist(l:cmd)
endfunction


" ── negative filter ───────────────────────────────────────────────────────────
" Finds which files DO contain term, then subtracts them from haystack.
" Avoids grep -L / rg --files-without-match portability headaches entirely.
function! s:FA_Exclude(term, haystack, flags, use_rg) abort
    if empty(a:haystack) | return [] | endif
    let l:fargs    = join(map(copy(a:haystack), 'shellescape(v:val)'), ' ')
    let l:cmd      = (a:use_rg ? 'rg -l ' : 'grep -l ')
        \ . a:flags . ' ' . shellescape(a:term) . ' ' . l:fargs
    let l:contains = systemlist(l:cmd)
    return filter(copy(a:haystack), 'index(l:contains, v:val) < 0')
endfunction


" ── first matching line in a file (quickfix preview) ─────────────────────────
function! s:FA_FirstMatch(term, file, flags, use_rg) abort
    let l:cmd = (a:use_rg
        \ ? 'rg -n --no-heading --no-filename '
        \ : 'grep -n ')
        \ . a:flags . ' '
        \ . shellescape(a:term) . ' ' . shellescape(a:file)
        \ . ' 2>/dev/null | head -n 1'
    return system(l:cmd)
endfunction


" ── main ──────────────────────────────────────────────────────────────────────
function! FindFilesWithAllWords(raw) abort
    let [l:opts, l:terms] = s:FA_Parse(a:raw)
    let l:pos    = filter(copy(l:terms), '!v:val.negate')
    let l:neg    = filter(copy(l:terms), ' v:val.negate')
    let l:use_rg = executable('rg')
    let l:flags  = s:FA_Flags(l:opts, l:use_rg)

    if empty(l:pos) && empty(l:neg)
        echo 'FindAll: please provide at least one search term.'
        return
    endif

    " ── build initial candidate list ──────────────────────────────────────────
    if empty(l:pos)
        " Only negations: start from all files, then subtract
        if l:use_rg
            let l:gp    = !empty(l:opts.glob) ? ' -g ' . shellescape(l:opts.glob) : ''
            let l:files = systemlist('rg --files' . l:gp . ' .')
        elseif !empty(l:opts.glob)
            let l:files = systemlist('find . -type f -name '
                \ . shellescape(l:opts.glob) . ' 2>/dev/null')
        else
            let l:files = systemlist('find . -type f 2>/dev/null')
        endif
    else
        " Seed from first positive term, intersect with the rest
        let l:files = s:FA_Include(l:pos[0].term, [], l:flags, l:use_rg)
        for l:tok in l:pos[1:]
            if empty(l:files) | break | endif
            let l:files = s:FA_Include(l:tok.term, l:files, l:flags, l:use_rg)
        endfor
    endif

    " ── subtract negated terms ────────────────────────────────────────────────
    for l:tok in l:neg
        if empty(l:files) | break | endif
        let l:files = s:FA_Exclude(l:tok.term, l:files, l:flags, l:use_rg)
    endfor

    " ── clean and validate paths ──────────────────────────────────────────────
    call map   (l:files, 'substitute(v:val, "[[:cntrl:]]", "", "g")')
    call filter(l:files, '!empty(v:val) && filereadable(v:val)')

    if empty(l:files)
        echo 'FindAll: no files matched.'
        return
    endif

    " ── build quickfix entries ────────────────────────────────────────────────
    let l:qf = []
    for l:file in l:files
        if !empty(l:pos)
            " Preview: first line matching the last positive term
            let l:raw = s:FA_FirstMatch(l:pos[-1].term, l:file, l:flags, l:use_rg)
            let l:m   = matchlist(l:raw, '^\(\d\+\):\(.*\)')
            if !empty(l:m)
                call add(l:qf, {
                    \ 'filename': l:file,
                    \ 'lnum':     str2nr(l:m[1]),
                    \ 'text':     '✔ ' . substitute(l:m[2], '^[ \t]*', '', '')
                    \ })
                continue
            endif
        endif
        " Fallback: first line of file as context
        let l:head = get(readfile(l:file, '', 1), 0, '')
        call add(l:qf, {
            \ 'filename': l:file,
            \ 'lnum':     1,
            \ 'text':     substitute(l:head, '^[ \t]*', '', '')
            \ })
    endfor

    " ── open quickfix ─────────────────────────────────────────────────────────
    call setqflist(l:qf)
    copen

    echo printf('FindAll: %d file(s)  [%s%s%s%s]  via %s',
        \ len(l:qf),
        \ l:opts.case_sensitive ? 'case-sensitive' : 'case-insensitive',
        \ l:opts.whole_word     ? ', whole-word'   : '',
        \ l:opts.fixed          ? ', fixed-string' : '',
        \ !empty(l:opts.glob)   ? ', glob:'  . l:opts.glob : '',
        \ l:use_rg              ? 'ripgrep'        : 'grep')
endfunction

" ── command ───────────────────────────────────────────────────────────────────
command! -nargs=+ FindAll call FindFilesWithAllWords(<q-args>)
