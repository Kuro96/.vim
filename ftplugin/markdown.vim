" Markdown folding by headings, callouts, and lists.
" Keep zc/zo/za using Vim's native fold commands; only define the fold shape.

if exists('b:did_markdown_fold_ftplugin')
    finish
endif
let b:did_markdown_fold_ftplugin = 1

setlocal foldmethod=expr
setlocal foldexpr=MarkdownFoldLevel(v:lnum)
setlocal foldtext=MarkdownFoldText()
setlocal foldlevelstart=99

let b:undo_ftplugin = get(b:, 'undo_ftplugin', '')
            \ . '|setlocal foldmethod< foldexpr< foldtext< foldlevelstart<'
            \ . '|unlet! b:did_markdown_fold_ftplugin'

function! MarkdownFoldLevel(lnum) abort
    let l:line = getline(a:lnum)

    if l:line =~# '^\s*$'
        return '='
    endif

    let l:heading = matchstr(l:line, '^#\{1,6}\ze\s')
    if !empty(l:heading)
        return '>' . strlen(l:heading)
    endif

    let l:base = MarkdownNearestHeadingLevel(a:lnum)
    let l:quote = MarkdownStripQuotePrefix(l:line)
    let l:text = l:quote.text

    if l:quote.depth > 0 && l:text =~# '^\[![^]]\+\]'
        return '>' . (l:base + l:quote.depth)
    endif

    let l:list_depth = MarkdownListDepth(l:text)
    if l:list_depth > 0
        return '>' . (l:base + l:quote.depth + l:list_depth)
    endif

    if l:quote.depth > 0
        return l:base + l:quote.depth
    endif

    let l:continued_list = MarkdownContinuedListDepth(a:lnum, l:text)
    if l:continued_list > 0
        return l:base + l:continued_list
    endif

    return l:base
endfunction

function! MarkdownFoldText() abort
    let l:line = substitute(getline(v:foldstart), '^\s*', '', '')
    let l:line_count = v:foldend - v:foldstart + 1
    return l:line . '  [' . l:line_count . ' lines]'
endfunction

function! MarkdownNearestHeadingLevel(lnum) abort
    let l:num = a:lnum
    while l:num > 0
        let l:heading = matchstr(getline(l:num), '^#\{1,6}\ze\s')
        if !empty(l:heading)
            return strlen(l:heading)
        endif
        let l:num -= 1
    endwhile
    return 0
endfunction

function! MarkdownStripQuotePrefix(line) abort
    let l:text = a:line
    let l:depth = 0

    while l:text =~# '^\s*>\s\?'
        let l:text = substitute(l:text, '^\s*>\s\?', '', '')
        let l:depth += 1
    endwhile

    return {'depth': l:depth, 'text': l:text}
endfunction

function! MarkdownListDepth(line) abort
    if a:line !~# '^\s*\([-+*]\|\d\+[.)]\)\s\+'
        return 0
    endif

    let l:indent = strlen(matchstr(a:line, '^\s*'))
    return float2nr(l:indent / 2) + 1
endfunction

function! MarkdownContinuedListDepth(lnum, line) abort
    if a:line !~# '^\s\{2,}\S'
        return 0
    endif

    let l:num = a:lnum - 1
    while l:num > 0
        let l:previous = MarkdownStripQuotePrefix(getline(l:num)).text
        let l:depth = MarkdownListDepth(l:previous)
        if l:depth > 0
            return l:depth
        endif
        if l:previous !~# '^\s*$' && l:previous !~# '^\s\{2,}\S'
            return 0
        endif
        let l:num -= 1
    endwhile

    return 0
endfunction
