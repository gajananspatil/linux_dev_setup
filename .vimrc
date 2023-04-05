set nocompatible
set tags=./tags;/,tags;/
set ts=4
set sw=4
set expandtab
colorscheme desert
set autoindent
set incsearch hlsearch
filetype on
syntax on

set number
set relativenumber
set splitright
set splitbelow

let mapleader="-"
let maplocalleader="-"
set encoding=utf-8
set lcs=eol:$,tab:>\ ,trail:.,extends:>,precedes:<

"Status Line setting
set statusline=
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}],%h%m%r%y=(%c,%l)/%L
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}],%h%m%r%y=(%c,%l)/%L\ %P


augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END


" Map Key codes

"" NNOREMAP

:hi CursorLine      cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn    cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white 

:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
:nnoremap <Leader>cc :set cursorcolumn!<CR>
:nnoremap <Leader>cl :set cursorline!<CR>
"augroup CursorLine
    "au!
    "au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    "au WinLeave * setlocal nocursorline
"augroup END



"ed vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<CR>

"source vimrc
:nnoremap <leader>sv :source $MYVIMRC<CR>


"Got to previous buffer
:nnoremap <leader>P :b#<CR>

"Open New Tab
:nnoremap <leader>nt :tabnew<CR>

"Close Tab
:nnoremap <leader>tc :tabclose<CR>


"List buffers and accept num to open buffer
:nnoremap <leader>b :ls<CR>:buffer<Space>

" Put "" quotes around currnet word
:nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" Put '' quotes around currnet word
:nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel


"Grep word under cursor in current dir
:nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<CR>:copen<CR>


"Toggle line number
:nnoremap <leader>n :setlocal number!<CR>

"Copy word under cursor
:nnoremap <leader>y viwy<esc>e

"Save buffer
:nnoremap <leader>w :w<esc>


"Quit buffer
:nnoremap <leader>q :q<esc>

"Toggle wrap
:nnoremap <leader>tw :se wrap!<CR>

"Toggle setlist
:nnoremap <leader>tsl :se list!<CR>

"Toggle expand tabs
:nnoremap <leader>et :se expandtab!<CR>


"INOREMAP Key strokes

"esc from insert mode
:inoremap jk <esc>


"copy word under cursor
:inoremap <leader>y <esc>viwy<esc>lea



" tagbar options and key combinations

let g:tabar_no_autocmds = 1
let g:tabgar_position = 'botright vertical'
let g:tagbar_file_size_lit = 0
let g:tagbar_use_cache = 1
let g:tagbar_ignore_anonymous = 0
let g:tabgar_height = 0
let g_tagbar_scrolloff = 0
let g:tagbar_show_ballon = 1
let g:tagbar_wrap = 0

"Open Tagbar
:nnoremap <leader>tb :TagbarOpenAutoClose<CR>

"Toggle Tagbar
:nnoremap <leader>tt :TagbarToggle<CR>

"AUTOCOMMAND
:autocmd filetype cpp,h nnoremap <buffer< <localleader>c I//<esc>


"Highlight 110th column with color
if v:version > 703
    set colorcolumn=110
    highlight ColorColumn ctermbg=darkgray

endif

" NERDTREE Mappings

" To identify + to expand directory
let g:NERDTreeDirArrows=0


"open NERDTree window
:nnoremap <leader>nt :NERDTreeToggle<CR>

"NERDTreeFind to refresh the window and reflect current dir and file
:nnoremap <leader>r :NERDTreeFind <CR> \| <c-w><c-p>


" return true iff is NERDTree open/active
function! s:syncTreeIf()
    let s:curwnum = winnr()
    NERDTreeFind
    exec s:curwnum . "wincmd w"
endfunction

" Shows NERDTree n start and synchronizes the tree with opened file when switching between open windows
"audocmf BufEnter * if &modifiable|call s:syncTreeIf


"VIMDIFF
"diff open buffer
:nnoremap <leader>df :windo diffthis<CR>

"ignore whilespace in diff
:nnoremap <leader>iws :set diffopt+=iwhite<CR>

