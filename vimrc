" General Settings
set nocompatible
set modeline modelines=5
set mouse=a
set nu  " Show line numbers
set encoding=utf-8
set fileencodings=utf-8,euc-cn
set list  " Show tabs, spaces, etc.
set incsearch  " Incremental search
set clipboard+=unnamed  " Shared clipboard
set ttimeoutlen=10  " Reduce delay when exiting insert mode
set updatetime=300
syntax sync minlines=256
set t_Co=256

" GUI Font Settings
set guifont=Fira\ Code\ 18

" Folding Settings
set foldmethod=syntax
set foldlevelstart=99

" File Writing Settings
set nobackup
set nowritebackup

" Indentation and Tabs
set bs=indent,eol,start  " Backspace behavior
set tf  " Fast terminal connection
set cc=79,120  " Color column
set ts=4  " Tab stop
set sw=4  " Shift width
set sts=4  " Soft tab stop
set ai  " Auto indent
set et  " Expand tab
set showmatch

" Window Navigation
noremap <C-LEFT> <C-w>h
noremap <C-DOWN> <C-w>j
noremap <C-UP> <C-w>k
noremap <C-RIGHT> <C-w>l

" Window Resizing
nnoremap <M-Up> :resize +2<CR>
nnoremap <M-Down> :resize -2<CR>
nnoremap <M-Left> :vertical resize -2<CR>
nnoremap <M-Right> :vertical resize +2<CR>

" FileType Specific Settings
filetype on
filetype plugin on
filetype indent on
syntax on

autocmd FileType c,cpp set ai et cindent foldmethod=syntax
autocmd FileType html set ai et ts=2 sw=2 sts=2
autocmd FileType json set ai et ts=2 sw=2 sts=2 foldmethod=indent
autocmd FileType yaml set ai et ts=2 sw=2 sts=2 foldmethod=indent
autocmd FileType javascript set ai et ts=2 sw=2 sts=2
autocmd FileType typescript set ai et ts=2 sw=2 sts=2
autocmd FileType css set ai et ts=2 sw=2 sts=2
autocmd FileType scss set ai et ts=2 sw=2 sts=2
autocmd FileType java set ai et
autocmd FileType python set foldmethod=indent
autocmd FileType tex set ai et ts=2 sw=2 sts=2
autocmd FileType bib set ai et ts=2 sw=2 sts=2
autocmd FileType gitconfig set noet

" Enable automatic header/source switching
autocmd BufEnter *.cpp,*.c,*.h nnoremap <silent> <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.c$,.h,:s,.X123X$,.cpp,<CR>

" Color Scheme
colorscheme monokai

" Custom Functions
function! s:syntax_query() abort
    for id in synstack(line("."), col("."))
        echo synIDattr(id, "name")
    endfor
endfunction
command! SyntaxQuery call s:syntax_query()

nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

for f in globpath('~/.vim/vimrc.d', '*.vim', 0, 1)
    if filereadable(f)
        execute 'source ' . fnameescape(f)
    endif
endfor

" Temporary Vim Scripts
if filereadable(expand('~/.vim/tmprc'))
autocmd BufNewFile,BufRead tmprc set filetype=vim
source $HOME/.vim/tmprc
endif

" vim:ai:et:ts=4:sw=4:sts=4:ff=unix:
