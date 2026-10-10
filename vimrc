let g:theme_mode = 'light'
let s:theme_mode_file = expand('~/.vim/theme.local.vim')
if filereadable(s:theme_mode_file)
    execute 'source ' . fnameescape(s:theme_mode_file)
endif

" General Settings
set nocompatible
set modeline modelines=5
set mouse=a
set number  " Show line numbers
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
set backspace=indent,eol,start  " Backspace behavior
set ttyfast  " Fast terminal connection
set colorcolumn=79,120  " Color column
set tabstop=4  " Tab stop
set shiftwidth=4  " Shift width
set softtabstop=4  " Soft tab stop
set autoindent  " Auto indent
set expandtab  " Expand tab
set showmatch

" Window Navigation
noremap <C-Left> <C-w>h
noremap <C-Down> <C-w>j
noremap <C-Up> <C-w>k
noremap <C-Right> <C-w>l

" Window Resizing
nnoremap <M-Up> :resize +2<CR>
nnoremap <M-Down> :resize -2<CR>
nnoremap <M-Left> :vertical resize -2<CR>
nnoremap <M-Right> :vertical resize +2<CR>

" Shortcut for <Esc>
inoremap fd <Esc>
vnoremap fd <Esc>

" FileType Specific Settings
filetype on
filetype plugin on
filetype indent on
syntax on

augroup local_filetypes
    autocmd!
    autocmd BufRead,BufNewFile *.j2,*.jinja,*.jinja2 setfiletype jinja
    autocmd FileType c,cpp      setlocal tabstop=8 cindent foldmethod=syntax
    autocmd FileType html       setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType json       setlocal tabstop=2 shiftwidth=2 softtabstop=2 foldmethod=indent
    autocmd FileType yaml       setlocal tabstop=2 shiftwidth=2 softtabstop=2 foldmethod=indent
    autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType css        setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType scss       setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType python     setlocal foldmethod=indent
    autocmd FileType tex        setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType bib        setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType gitconfig  setlocal noexpandtab
    autocmd FileType make       setlocal noexpandtab
augroup END

" Cursor
let &t_EI = "\e[2 q" " normal/visual
let &t_SI = "\e[6 q" " insert
let &t_SR = "\e[4 q" " replace
augroup local_cursor
    autocmd!
    autocmd VimLeave * silent !echo -ne "\e[2 q"
augroup END

" Enable automatic header/source switching
augroup local_header_switch
    autocmd!
    autocmd BufEnter *.cpp,*.c,*.h nnoremap <silent> <F4> :edit %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.c$,.h,:s,.X123X$,.cpp,<CR>
augroup END

" Color Scheme
if has('termguicolors')
    set termguicolors
endif

function! s:apply_theme() abort
    let g:airline_theme = g:theme_mode ==# 'dark' ? 'base16_monokai' : 'warm_editorial'
    execute 'colorscheme ' . (g:theme_mode ==# 'dark' ? 'monokai' : 'warm_editorial')
    if exists(':AirlineTheme')
        execute 'AirlineTheme ' . g:airline_theme
    endif
endfunction
call s:apply_theme()

" Misc
if executable('rg')
    set grepprg=rg\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
endif

augroup local_quickfix
    autocmd!
    autocmd QuickFixCmdPost grep copen
augroup END
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>ccl :cclose<CR>

" Custom Functions
function! s:syntax_query() abort
    for id in synstack(line('.'), col('.'))
        echo synIDattr(id, 'name')
    endfor
endfunction
command! SyntaxQuery call s:syntax_query()

nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>" viw<Esc>a"<Esc>bi"<Esc>lel
nnoremap <Leader>' viw<Esc>a'<Esc>bi'<Esc>lel

for f in globpath('~/.vim/vimrc.d', '*.vim', 0, 1)
    if filereadable(f)
        execute 'source ' . fnameescape(f)
    endif
endfor

function! s:refresh_theme() abort
    let l:previous_mode = g:theme_mode
    if filereadable(s:theme_mode_file)
        execute 'source ' . fnameescape(s:theme_mode_file)
    endif
    if g:theme_mode !=# l:previous_mode
        call s:apply_theme()
    endif
endfunction

augroup local_theme
    autocmd!
    autocmd FocusGained * call <SID>refresh_theme()
augroup END

" Temporary Vim Scripts
augroup local_temporary
    autocmd!
    if filereadable(expand('~/.vim/tmprc'))
        autocmd BufRead,BufNewFile tmprc set filetype=vim
    endif
augroup END
if filereadable(expand('~/.vim/tmprc'))
    source $HOME/.vim/tmprc
endif

" vim:autoindent:expandtab:tabstop=4:shiftwidth=4:softtabstop=4:fileformat=unix:
