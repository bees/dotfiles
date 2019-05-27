set number
set formatoptions=cro
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set hlsearch
set hidden
set backspace=indent,eol,start
set directory=$HOME/.config/nvim/swapfiles//
set updatetime=100
set encoding=UTF-8

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
Plug 'jxnblk/vim-mdx-js'

"Utility
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
"Plug 'zchee/deoplete-jedi'
"Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn global add tern' }
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'davidhalter/jedi-vim'
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
Plug 'editorconfig/editorconfig-vim'

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
Plug 'Soares/base16.nvim'
Plug 'daviesjamie/vim-base16-lightline'
"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'kristijanhusak/defx-git'
"Plug 'kristijanhusak/defx-icons'


call plug#end()

" Theme
"""""""""""""""""""
"let g:sierra_Midnight = 1
"colo sierra
set termguicolors
"set background=dark
"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_italic = 1
"let g:two_firewatch_italics=1
"let g:seoul256_background = 256
colo challenger_deep
"colo vimspectr30-light



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

" Deoplete
let g:jsx_ext_required = 0
let g:deoplete#enable_at_startup = 1

" Deoplete Python
let g:python3_host_prog = '/home/ad/.pyenv/versions/neovim3/bin/python'

" Deoplete tern
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue'
                \ ]

" Vim Jedi
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#goto_assignments_command = ''  " dynamically done for ft=python.
"let g:jedi#goto_definitions_command = ''  " dynamically done for ft=python.
"let g:jedi#rename_command = '<Leader>gR'
"let g:jedi#usages_command = '<Leader>gu'
"let g:jedi#completions_enabled = 0
"let g:jedi#smart_auto_mappings = 1
"let g:jedi#auto_close_doc = 1

" ale
let g:ale_linters = {
\   'vue': ['vls', 'eslint'],
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\}

"\   'python': ['flake8', 'mypy'],

"let g:ale_python_black_options  = '--fast --line-length=88'

" \   'python': ['black'],
let g:ale_fixers = {
\   'typescript': ['prettier'],
\   'javascript': ['prettier'],
\   'tsx': ['tslint'],
\   'vue': ['prettier'],
\   'mdx': ['prettier'],
\   'json': ['prettier'],
\}

"\   'javascript': ['prettier', 'eslint'],
"\   'yaml': ['prettier'],

let g:ale_fix_on_save = 1

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript']

"gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_grep = 'rg'

" vimwiki
nmap <Leader>tt <Plug>VimwikiToggleListItem

" Fluff
"""""""""""""""""""

" lightline

set laststatus=2
let g:lightline = {
      \'colorscheme': 'challenger_deep',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'modified', 'cocstatus' ],
      \             [ 'filepath',  ] ],
      \   'right': [
      \              [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ]
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


" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" mappings
"""""""""""""""""""

let mapleader=" "
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


" coc
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>

" syntax specific rules
"""""""""""""""""""

au FileType javascript,jsx  setl sw=4 sts=4 et
au FileType typescript,tsx  setl sw=4 sts=4 et
au FileType json        setl sw=2 sts=2 et
au FileType vue         setl sw=2 sts=2 et
au FileType python      setl sw=4 sts=4 et

autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
