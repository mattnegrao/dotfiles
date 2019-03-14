" Author: Matheus Moraes
" " https://github.com/matheusmoraes

" # Plugins {
call plug#begin()

" Essentials
";Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'eugen0329/vim-esearch'
" Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" Theming
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
" }

" # Basic config {
let mapleader=","

colorscheme PaperColor
set background=dark
let g:airline_theme='minimalist'

set hidden
set number
set relativenumber
set mouse=
set inccommand=split
set incsearch
set hlsearch
set clipboard+=unnamedplus
" }

autocmd FileType html,css,javascript.jsx EmmetInstall
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

nnoremap <leader>rl :source ~/.config/nvim/init.vim<cr>
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|DS_Store\|git'

" # Split {
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }

" # Tabs {
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" }
"
nnoremap <C-Up> :bn<CR>
nnoremap <C-Down> :bp<CR>

" # NERDTree  {
noremap <leader>bw :NERDTreeToggle<CR>
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowLineNumbers = 1
" }

" # esearch {
let g:esearch = {
  \ 'adapter':    'ag',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}
" }

" # Folding {
nnoremap <Space> za
" " Files open expanded
set foldlevelstart=50
" " Use decent folding
set foldmethod=indent
" }


" # Languages highlight and spacing {
"
" " Global tab width.
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" " ALE
let g:ale_linters = {'javascript': ['standard']}
let g:ale_fixers = {
\   'javascript': ['standard'],
\}
let g:ale_fix_on_save = 1

autocmd BufRead,BufNewFile *.json set filetype=javascript
autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript set tabstop=2
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.bluep set fuletype=markdown
autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set tabstop=2
autocmd FileType html set shiftwidth=2
autocmd FileType html set tabstop=2
" }

autocmd BufWritePre * %s/\s\+$//e

" # Column 60 {
if exists('+colorcolumn')
    set colorcolumn=60
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" }
