" =============================================================================
" Filename: autoload/lightline/colorscheme/spectr30-light.vim
" Author: atweiden, modified by bees
" License: MIT License
" Last Change: 2018/05/23 09:23:27.
" =============================================================================
" gui colours
"let s:g0 = 'fffaf5' #black
"let s:g1 = 'ede4da'
"let s:g2 = '918579' # bright black
"let s:g3 = '918579'
"let s:g4 = '756758'
"let s:g5 = '756758' # white
"let s:g6 = '302820'
"let s:g7 = '1a140f'
"let s:g8 = 'e04d38' #red
"let s:g9 = 'e07638'
"let s:gA = 'e0b738' #yellow
"let s:gB = '699e34' #green
"let s:gC = '349e90' # cyan
"let s:gD = '4286c9' # blue
"let s:gE = 'a565c9' # magenta
"let s:gF = 'e0708c'

let s:base03 = [ '#918579', 233 ]
let s:base02 = [ '#918579 ', 236 ]
let s:base01 = [ '#ede4da', 239 ]
let s:base00 = [ '#fffaf5', 242  ]
let s:base0 = [ '#fffaf5', 244 ]
let s:base1 = [ '#ede4da', 246 ]
let s:base2 = [ '#918579', 248 ]
let s:base3 = [ '#918579', 253 ]
let s:yellow = [ '#e0b738', 3 ]
let s:orange = [ '#e0708c', 216 ]
let s:red = [ '#e04d38', 131 ]
let s:magenta = [ '#a565c9', 168 ]
let s:peach = [ '#e07638', 181 ]
let s:blue = [ '#4286c9', 109 ]
let s:cyan = [ '#349e90', 23 ]
let s:green = [ '#699e34', 108 ]
let s:white = [ '756758', 252 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base00, s:blue ], [ s:base3, s:base00 ] ]
let s:p.normal.right = [ [ s:base00, s:base1 ], [ s:base2, s:base01 ] ]
let s:p.inactive.right = [ [ s:base02, s:base00 ], [ s:base0, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base0, s:base02 ], [ s:base00, s:base02 ] ]
let s:p.insert.left = [ [ s:base00, s:green ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base00, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base00, s:peach ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base0, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base00, s:base02 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base02 ] ]
let s:p.tabline.middle = [ [ s:base02, s:base1 ] ]
let s:p.tabline.right = [ [ s:base02, s:base00 ] ]
let s:p.normal.error = [ [ s:red, s:base02 ] ]
let s:p.normal.warning = [ [ s:yellow, s:base01 ] ]

let g:lightline#colorscheme#spectr30_light#palette = lightline#colorscheme#flatten(s:p)
