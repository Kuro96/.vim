" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
let g:NERDTreeFileLines = 1
let g:NERDTreeNaturalSort = 1

nnoremap <leader>n :NERDTreeFind %<CR>
nnoremap <C-n> :NERDTreeVCS %:p:h<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
