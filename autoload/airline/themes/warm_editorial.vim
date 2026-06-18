" warm_editorial airline theme.

let s:paper = '#F5EBDD'
let s:paper_panel = '#EFE2CD'
let s:paper_element = '#E8D8BF'
let s:paper_select = '#D9C7AD'
let s:ink = '#2B211C'
let s:ink_soft = '#7A6A5B'
let s:border_strong = '#1E1714'
let s:terracotta = '#B85C38'
let s:terracotta_dark = '#A24D3D'
let s:mustard = '#D9A441'
let s:olive = '#68794A'
let s:blue_grey = '#4E6E8E'
let s:mauve = '#7A5272'

let g:airline#themes#warm_editorial#palette = {}

let s:N1 = [s:paper, s:border_strong, 231, 233]
let s:N2 = [s:ink, s:paper_select, 235, 187]
let s:N3 = [s:ink_soft, s:paper_panel, 243, 254]
let g:airline#themes#warm_editorial#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:I1 = [s:paper, s:blue_grey, 231, 24]
let s:I2 = [s:ink, s:paper_select, 235, 187]
let s:I3 = [s:blue_grey, s:paper_panel, 24, 254]
let g:airline#themes#warm_editorial#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let s:V1 = [s:paper, s:mauve, 231, 96]
let s:V2 = [s:ink, s:paper_select, 235, 187]
let s:V3 = [s:mauve, s:paper_panel, 96, 254]
let g:airline#themes#warm_editorial#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:R1 = [s:paper, s:terracotta_dark, 231, 131]
let s:R2 = [s:ink, s:paper_select, 235, 187]
let s:R3 = [s:terracotta_dark, s:paper_panel, 131, 254]
let g:airline#themes#warm_editorial#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let s:IA1 = [s:ink_soft, s:paper_element, 243, 254]
let s:IA2 = [s:ink_soft, s:paper_panel, 243, 254]
let s:IA3 = [s:ink_soft, s:paper_panel, 243, 254]
let g:airline#themes#warm_editorial#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

let g:airline#themes#warm_editorial#palette.normal.airline_warning = [s:ink, s:mustard, 235, 179]
let g:airline#themes#warm_editorial#palette.normal.airline_error = [s:paper, s:terracotta_dark, 231, 131]
let g:airline#themes#warm_editorial#palette.insert.airline_warning = g:airline#themes#warm_editorial#palette.normal.airline_warning
let g:airline#themes#warm_editorial#palette.insert.airline_error = g:airline#themes#warm_editorial#palette.normal.airline_error
let g:airline#themes#warm_editorial#palette.visual.airline_warning = g:airline#themes#warm_editorial#palette.normal.airline_warning
let g:airline#themes#warm_editorial#palette.visual.airline_error = g:airline#themes#warm_editorial#palette.normal.airline_error
let g:airline#themes#warm_editorial#palette.replace.airline_warning = g:airline#themes#warm_editorial#palette.normal.airline_warning
let g:airline#themes#warm_editorial#palette.replace.airline_error = g:airline#themes#warm_editorial#palette.normal.airline_error
