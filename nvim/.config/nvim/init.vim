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
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn global add tern' }
Plug 'sebastianmarkow/deoplete-rust'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'shime/vim-livedown'
Plug 'mattn/vim-sqlfmt'
Plug 'vimwiki/vimwiki'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'

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
"let g:gruvbox_contrast_dark = 'dark'
"let g:two_firewatch_italics=1
"let g:seoul256_background = 256
"colo seoul256
"colo vimspectr30-light
colorscheme Base2Tone_EveningDark



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
call deoplete#custom#option('complete_method', 'omnifunc')

" Deoplete Python
let g:python3_host_prog = '/home/ad/.pyenv/versions/neovim3/bin/python'

" Deoplete tern
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue'
                \ ]

" Deoplete rust
let g:deoplete#sources#rust#racer_binary='/home/ad/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/ad/Documents/rust'


" Vim Jedi
let g:jedi#auto_vim_configuration = 0
let g:jedi#goto_assignments_command = ''  " dynamically done for ft=python.
let g:jedi#goto_definitions_command = ''  " dynamically done for ft=python.
let g:jedi#rename_command = '<Leader>gR'
let g:jedi#usages_command = '<Leader>gu'
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 1
let g:jedi#auto_close_doc = 1

" ale
let g:ale_linters = {
\   'vue': ['vls', 'eslint'],
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\   'python': ['flake8', 'pylint', 'mypy'],
\}

let g:ale_python_mypy_options = '--ignore-missing-imports'

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'vue': ['prettier'],
\   'python': ['black', 'trim_whitespace', 'remove_trailing_lines'],
\   'sql': ['sqlfmt', 'trim_whitespace', 'remove_trailing_lines'],
\}

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
      \ 'colorscheme': 'Base2Tone_Evening',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \             [ 'filepath' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filepath': 'MyFilename',
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
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "u",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


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

" syntax specific rules
"""""""""""""""""""

au FileType javascript,jsx  setl sw=4 sts=4 et
au FileType json        setl sw=2 sts=2 et
au FileType vue         setl sw=2 sts=2 et
au FileType python      setl sw=4 sts=4 et
au FileType proto       setl sw=4 sts=4 et
