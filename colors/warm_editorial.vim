" warm_editorial, matched to OpenCode's warm_editorial theme.

set background=light
highlight clear

if exists('syntax_on')
    syntax reset
endif

let colors_name = 'warm_editorial'

let s:paper = '#F5EBDD'
let s:paper_panel = '#EFE2CD'
let s:paper_element = '#E8D8BF'
let s:paper_menu = '#FFF3E1'
let s:paper_select = '#D9C7AD'
let s:ink = '#2B211C'
let s:ink_soft = '#7A6A5B'
let s:border = '#7A5C45'
let s:border_strong = '#1E1714'
let s:terracotta = '#B85C38'
let s:terracotta_dark = '#A24D3D'
let s:mustard = '#D9A441'
let s:olive = '#68794A'
let s:sage = '#5F7F77'
let s:blue_grey = '#4E6E8E'
let s:mauve = '#7A5272'
let s:diff_added_bg = '#DFE5C8'
let s:diff_removed_bg = '#EACFC2'

function! s:hi(group, fg, bg, attr) abort
    let l:cmd = 'highlight ' . a:group
    let l:cmd .= ' guifg=' . (empty(a:fg) ? 'NONE' : a:fg)
    let l:cmd .= ' guibg=' . (empty(a:bg) ? 'NONE' : a:bg)
    let l:cmd .= ' gui=' . (empty(a:attr) ? 'NONE' : a:attr)
    let l:cmd .= ' cterm=' . (empty(a:attr) ? 'NONE' : a:attr)
    execute l:cmd
endfunction

call s:hi('Normal', s:ink, s:paper, '')
call s:hi('NormalFloat', s:ink, s:paper_panel, '')
call s:hi('ColorColumn', '', s:paper_element, '')
call s:hi('Cursor', s:paper, s:terracotta, '')
call s:hi('CursorColumn', '', s:paper_panel, '')
call s:hi('CursorLine', '', s:paper_panel, '')
call s:hi('LineNr', s:ink_soft, s:paper_panel, '')
call s:hi('CursorLineNr', s:terracotta, s:paper_panel, 'bold')
call s:hi('SignColumn', s:ink_soft, s:paper_panel, '')
call s:hi('FoldColumn', s:ink_soft, s:paper_panel, '')
call s:hi('VertSplit', s:border, s:paper, '')
call s:hi('WinSeparator', s:border, s:paper, '')
call s:hi('Visual', s:ink, s:paper_select, '')
call s:hi('Search', s:ink, s:mustard, '')
call s:hi('IncSearch', s:paper, s:terracotta, 'bold')
call s:hi('MatchParen', s:terracotta_dark, s:paper_select, 'bold')
call s:hi('NonText', s:paper_select, '', '')
call s:hi('Whitespace', s:paper_select, '', '')
call s:hi('SpecialKey', s:ink_soft, '', '')
call s:hi('Conceal', s:ink_soft, s:paper, '')
call s:hi('Directory', s:blue_grey, '', '')
call s:hi('Title', s:terracotta, '', 'bold')
call s:hi('Question', s:blue_grey, '', 'bold')
call s:hi('MoreMsg', s:olive, '', '')
call s:hi('ModeMsg', s:blue_grey, '', '')
call s:hi('WarningMsg', s:terracotta_dark, '', 'bold')
call s:hi('ErrorMsg', s:paper, s:terracotta_dark, 'bold')

call s:hi('StatusLine', s:paper, s:border_strong, 'bold')
call s:hi('StatusLineNC', s:ink_soft, s:paper_element, '')
call s:hi('TabLine', s:ink_soft, s:paper_element, '')
call s:hi('TabLineSel', s:ink, s:paper_select, 'bold')
call s:hi('TabLineFill', '', s:paper_panel, '')
call s:hi('Pmenu', s:ink, s:paper_menu, '')
call s:hi('PmenuSel', s:paper, s:blue_grey, 'bold')
call s:hi('PmenuSbar', '', s:paper_element, '')
call s:hi('PmenuThumb', '', s:paper_select, '')
call s:hi('WildMenu', s:paper, s:terracotta, 'bold')

call s:hi('Folded', s:ink_soft, s:paper_panel, 'italic')
call s:hi('DiffAdd', s:olive, s:diff_added_bg, '')
call s:hi('DiffDelete', s:terracotta_dark, s:diff_removed_bg, '')
call s:hi('DiffChange', s:blue_grey, s:paper_panel, '')
call s:hi('DiffText', s:ink, s:paper_select, 'bold')

call s:hi('Comment', s:ink_soft, '', 'italic')
call s:hi('Constant', s:mauve, '', '')
call s:hi('String', s:olive, '', '')
call s:hi('Character', s:olive, '', '')
call s:hi('Number', s:mauve, '', '')
call s:hi('Boolean', s:mauve, '', '')
call s:hi('Float', s:mauve, '', '')
call s:hi('Identifier', s:ink, '', '')
call s:hi('Function', s:blue_grey, '', '')
call s:hi('Statement', s:terracotta, '', 'bold')
call s:hi('Conditional', s:terracotta, '', 'bold')
call s:hi('Repeat', s:terracotta, '', 'bold')
call s:hi('Label', s:terracotta, '', 'bold')
call s:hi('Operator', s:terracotta_dark, '', '')
call s:hi('Keyword', s:terracotta, '', 'bold')
call s:hi('Exception', s:terracotta_dark, '', 'bold')
call s:hi('PreProc', s:terracotta_dark, '', '')
call s:hi('Include', s:terracotta, '', '')
call s:hi('Define', s:terracotta_dark, '', '')
call s:hi('Macro', s:terracotta_dark, '', '')
call s:hi('PreCondit', s:terracotta_dark, '', '')
call s:hi('Type', s:sage, '', '')
call s:hi('StorageClass', s:sage, '', 'italic')
call s:hi('Structure', s:sage, '', '')
call s:hi('Typedef', s:sage, '', '')
call s:hi('Special', s:mustard, '', '')
call s:hi('SpecialChar', s:terracotta, '', '')
call s:hi('Tag', s:blue_grey, '', '')
call s:hi('Delimiter', s:ink_soft, '', '')
call s:hi('SpecialComment', s:sage, '', 'italic')
call s:hi('Debug', s:terracotta_dark, '', '')
call s:hi('Underlined', s:blue_grey, '', 'underline')
call s:hi('Ignore', s:paper_select, '', '')
call s:hi('Error', s:paper, s:terracotta_dark, '')
call s:hi('Todo', s:terracotta_dark, s:paper_element, 'bold')

call s:hi('SpellBad', s:terracotta_dark, '', 'underline')
call s:hi('SpellCap', s:blue_grey, '', 'underline')
call s:hi('SpellRare', s:mauve, '', 'underline')
call s:hi('SpellLocal', s:sage, '', 'underline')

highlight link htmlTag Delimiter
highlight link htmlEndTag Delimiter
highlight link htmlTagName Statement
highlight link markdownHeadingDelimiter Statement
highlight link markdownCode String
highlight link markdownCodeBlock String
highlight link markdownLinkText Function
highlight link markdownUrl Underlined
highlight link CocErrorSign ErrorMsg
highlight link CocWarningSign WarningMsg
highlight link CocInfoSign Directory
highlight link CocHintSign Type
