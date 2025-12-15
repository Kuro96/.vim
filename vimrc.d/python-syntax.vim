let g:python_highlight_all = 1

" Split 'def' and 'class' from pythonStatement to allow distinct highlighting (Sublime style)
augroup PythonSublimeMonokai
  autocmd!
  autocmd Syntax python syn keyword pythonDefinition def nextgroup=pythonFunction skipwhite
  autocmd Syntax python syn keyword pythonDefinition class nextgroup=pythonClass skipwhite
augroup END
