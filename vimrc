set nocompatible

" general settings that'd make people happy
set modeline modelines=5
set mouse=a
set nu
set fileencodings=utf-8,euc-cn
set list
set incsearch
" https://vi.stackexchange.com/questions/16148/slow-vim-escape-from-insert-mode
set ttimeoutlen=10

set foldmethod=marker

" only write file once when saving
set nowritebackup

" referenced from yueyoum/dotfiles with some personal touch
set bs=indent,eol,start  " backspace
set tf  " ttyfast
set cc=79  " colorcolumn
set ts=4  " tabstop
set sw=4  " shiftwidth
set sts=4  " softtabstop
set ai  " autoindent
set et  " expandtab

noremap <C-LEFT> <C-w>h
noremap <C-DOWN> <C-w>j
noremap <C-UP> <C-w>k
noremap <C-RIGHT> <C-w>l

"filetype on
"filetype plugin on
"filetype indent on
"syntax on

autocmd FileType html set ai et ts=2 sw=2 sts=2
autocmd FileType json set ai et ts=2 sw=2 sts=2
autocmd FileType javascript set ai et ts=2 sw=2 sts=2
autocmd FileType css set ai et ts=2 sw=2 sts=2
autocmd FileType scss set ai et ts=2 sw=2 sts=2
autocmd FileType java set ai et
autocmd FileType tex set ai et ts=2 sw=2 sts=2
autocmd FileType bib set ai et ts=2 sw=2 sts=2

colorscheme monokai

" font
if has("gui_running")
    set gfn=FiraCode\ 14
    set gfw=Source\ Han\ Sans\ 14

    behave mswin
endif

" indentLine
let g:indentLine_setColors = 0
let g:indentLine_char = '│'


function! s:syntax_query() abort
    for id in synstack(line("."), col("."))
        echo synIDattr(id, "name")
    endfor
endfunction
command! SyntaxQuery call s:syntax_query()

" vim:ai:et:ts=4:sw=4:sts=4:ff=unix:
