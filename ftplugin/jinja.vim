" Jinja comments and indentation-based folding with native zc/zo/za commands.
if exists('b:did_jinjaplugin')
    finish
endif
let b:did_jinjaplugin = 1

setlocal commentstring={#\ %s\ #}
setlocal foldmethod=indent

let b:undo_ftplugin = get(b:, 'undo_ftplugin', '')
            \ . '|setlocal commentstring< foldmethod<'
            \ . '|unlet! b:did_jinjaplugin'
