scriptencoding utf-8
set number
set formatoptions=cro
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set hlsearch
set hidden
set backspace=indent,eol,start
set directory=$HOME/.local/share/nvim/swap/
set tags=./tags;,tags;,.tags;

" Plugin specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.local/share/nvim/plugged')


" Syntax
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'wavded/vim-stylus'
Plug 'digitaltoad/vim-pug'
Plug 'sophacles/vim-bundle-mako'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'w0rp/ale'
Plug 'nikvdp/ejs-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'sheerun/vim-polyglot'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mxw/vim-jsx'
Plug 'reasonml-editor/vim-reason-plus'

"Utility
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'
"Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn global add tern' }
"Plug 'sebastianmarkow/deoplete-rust'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'davidhalter/jedi-vim'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'shime/vim-livedown'
Plug 'mattn/vim-sqlfmt'
Plug 'vimwiki/vimwiki'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'
Plug 'zchee/deoplete-clang'
Plug 'ElmCast/elm-vim'
Plug 'jxnblk/vim-mdx-js'

" Fluff
Plug 'AlessandroYorba/Sierra'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ntpeters/vim-better-whitespace'
Plug 'joshdick/onedark.vim'
Plug 'cseelus/vim-colors-lucid'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'mbbill/undotree'
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'jnurmine/Zenburn'
Plug 'acepukas/vim-zenburn'
Plug 'nightsense/vimspectr'
Plug 'junegunn/seoul256.vim'
Plug 'atelierbram/Base2Tone-vim'
Plug 'chrisbra/Colorizer'

call plug#end()

" Theme
"""""""""""""""""""
"let g:sierra_Midnight = 1
"colo sierra
set termguicolors
if has('nvim')
  " https://github.com/neovim/neovim/wiki/FAQ
  set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
endif
"let g:two_firewatch_italics=1
"let g:seoul256_background = 256
"colo seoul256
"colo vimspectr30-light
colorscheme challenger_deep




" Utilities
"""""""""""""""""""

" LanguageClient

let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

" fzf
nnoremap <C-p> :FZF<CR>
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


"set rtp+=~/.fzf

" Tagbar
nmap <leader>t :TagbarToggle<CR>


" ale
let g:ale_linters = {
\   'vue': ['vls', 'eslint'],
\   'python': ['flake8', 'pylint', 'mypy'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'vim': ['vint'],
\   'haskell': [],
\}

let g:ale_python_mypy_options = '--ignore-missing-imports'

let g:ale_fixers = {
\   'vue': ['prettier'],
\   'python': ['black', 'trim_whitespace', 'remove_trailing_lines'],
\   'sql': ['sqlfmt', 'trim_whitespace', 'remove_trailing_lines'],
\   'elixir': ['mix_format'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier'],
\   'reason': ['refmt'],
\}

let g:ale_linters_ignore = {'typescript': ['tslint', 'eslint']}

let g:ale_python_black_options = '-l 79'

let g:ale_fix_on_save = 1

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript']

"gitgutter
let g:gitgutter_map_keys = 0


" vimwiki
nmap <Leader>tt <Plug>VimwikiToggleListItem

" Fluff
"""""""""""""""""""

" lightline

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'challenger_deep',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \             [ 'cocstatus' ],
      \             [ 'filepath' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filepath': 'MyFilename',
      \   'cocstatus': 'coc#status',
      \ },
      \ }


function! MyFilename()
  return expand('%:f')
endfunction



" nerdtree
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''


" nerdtree git plugin
let g:NERDTreeIndicatorMapCustom = {
    \ 'Modified'  : '✹',
    \ 'Staged'    : '✚',
    \ 'Untracked' : 'u',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Deleted'   : '✖',
    \ 'Dirty'     : '✗',
    \ 'Clean'     : '✔︎',
    \ 'Ignored'   : '☒',
    \ 'Unknown'   : '?'
    \ }


let g:colorizer_auto_filetype='jsx,css,html,dosini'

" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" mappings
"""""""""""""""""""

let mapleader=' '
map <f12> :!start /min ctags -R .<cr>
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <C-c> :bp <BAR> bd #<CR>

nmap <leader>bl :ls<CR>
nmap <leader>a :badd
nmap <leader>e :NERDTreeToggle<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" syntax specific rules
"""""""""""""""""""

au FileType javascript,jsx  setl sw=2 sts=2 et
au FileType json        setl sw=2 sts=2 et
au FileType vue         setl sw=2 sts=2 et
au FileType python      setl sw=4 sts=4 et
au FileType proto       setl sw=4 sts=4 et
au FileType reason  setl sw=2 sts=2 et

