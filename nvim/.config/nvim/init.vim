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
"Plug 'hail2u/vim-css3-syntax'
"Plug 'cakebaker/scss-syntax.vim'
Plug 'plasticboy/vim-markdown'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'mxw/vim-jsx'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'jxnblk/vim-mdx-js'
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

"Utility
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'shime/vim-livedown'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf'
Plug 'editorconfig/editorconfig-vim'
Plug 'markonm/traces.vim'
Plug 'mbbill/undotree'
Plug 'slashmili/alchemist.vim'

" Fluff
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'


call plug#end()

" Theme
"""""""""""""""""""
let g:onedark_terminal_italics=1
set termguicolors
colorscheme onedark

" Utilities
"""""""""""""""""""
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
      \'colorscheme': 'onedark',
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
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
nmap <silent> <leader><Enter> :CocList buffers<cr>
nmap <silent> <leader>m :CocList mru<cr>

" syntax specific rules
"""""""""""""""""""

au FileType javascript,jsx  setl sw=4 sts=4 et
au FileType typescript,tsx  setl sw=4 sts=4 et
au FileType json        setl sw=2 sts=2 et
au FileType vue         setl sw=2 sts=2 et
au FileType python      setl sw=4 sts=4 et

autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
