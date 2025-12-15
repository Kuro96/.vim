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

" Shortcut for <ESC>
inoremap fd <esc>
vnoremap fd <esc>

" FileType Specific Settings
filetype on
filetype plugin on
filetype indent on
syntax on

" Cursor
let &t_EI = "\e[2 q" " normal/visual
let &t_SI = "\e[6 q" " insert
let &t_SR = "\e[4 q" " replace
autocmd VimLeave * silent !echo -ne "\e[2 q"

autocmd FileType c,cpp          setl ts=8 cindent foldmethod=syntax
autocmd FileType html           setl ts=2 sw=2 sts=2
autocmd FileType json           setl ts=2 sw=2 sts=2 foldmethod=indent
autocmd FileType yaml           setl ts=2 sw=2 sts=2 foldmethod=indent
autocmd FileType javascript     setl ts=2 sw=2 sts=2
autocmd FileType typescript     setl ts=2 sw=2 sts=2
autocmd FileType css            setl ts=2 sw=2 sts=2
autocmd FileType scss           setl ts=2 sw=2 sts=2
autocmd FileType python         setl foldmethod=indent
autocmd FileType tex            setl ts=2 sw=2 sts=2
autocmd FileType bib            setl ts=2 sw=2 sts=2
autocmd FileType gitconfig      setl noet
autocmd FileType make           setl noet

" Enable automatic header/source switching
autocmd BufEnter *.cpp,*.c,*.h nnoremap <silent> <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.c$,.h,:s,.X123X$,.cpp,<CR>

" Color Scheme
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
colorscheme monokai
if has("termguicolors")
    set termguicolors
endif

" Misc
if executable('rg')
    set grepprg=rg\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
endif

autocmd QuickFixCmdPost grep copen
nnoremap <leader>co :copen<cr>
nnoremap <leader>ccl :cclose<cr>

" Custom Functions
function! s:syntax_query() abort
    for id in synstack(line("."), col("."))
        echo synIDattr(id, "name")
    endfor
endfunction
command! SyntaxQuery call s:syntax_query()

nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

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
