" Author: Matheus Negrão
" " https://github.com/mattnegrao

" # Plugins {
call plug#begin()

" Essentials
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'eugen0329/vim-esearch'
Plug 'ap/vim-css-color'
Plug 'alvan/vim-closetag'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'elixir-editors/vim-elixir'


Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif



" Theming
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
" }

" # Basic config {
let mapleader=","

colorscheme PaperColor
syntax enable
" let g:solarized_termcolors=256
set background=dark
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1

set hidden
set number
set relativenumber
set mouse=
set inccommand=split
set incsearch
set hlsearch
set clipboard+=unnamedplus
set mmp=5000 " Fix syntax highlight on large files
" }

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
" let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'

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
noremap <leader>bb :NERDTreeToggle<CR>
noremap <leader>bf :NERDTreeFocus<CR>
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
"
" " Find files using Telescope command-line sugar.
nnoremap <leader>fd <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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


" autocmd BufRead,BufNewFile *.json set filetype=javascript
autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript set tabstop=2
autocmd FileType typescript set shiftwidth=2
autocmd FileType typescript set tabstop=2
autocmd FileType typescriptreact set shiftwidth=2
autocmd FileType typescriptreact set tabstop=2
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
