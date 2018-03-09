" Author: Matheus Moraes
" " https://github.com/matheusmoraes

" # Plugins {
call plug#begin()

" Essentials
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'

" Theming
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
" }


" # Basic config {
let mapleader=","

colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'

set hidden
set number
set relativenumber
set mouse=a
set inccommand=split
set incsearch
set nohlsearch
set clipboard=unnamed
" }


nnoremap <leader>rl :source ~/.config/nvim/init.vim<cr>

" # Split {
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }

" # NERDTree  {
noremap <leader>bw :NERDTreeToggle<CR>
let g:NERDTreeHijackNetrw = 0
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

autocmd BufRead,BufNewFile *.json set filetype=javascript
autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript set tabstop=2
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.bluep set fuletype=markdown
autocmd FileType ruby set shiftwidth=2
autocmd FileType ruby set tabstop=2
" }


" # Column 80 {
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" }
