call plug#begin('~/.vim/plugged')

" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'dracula/vim'
Plug 'ayu-theme/ayu-vim'
Plug 'fatih/molokai'
Plug 'scrooloose/nerdtree'
Plug 'hauleth/blame.vim'
Plug 'tpozzi/Sidonia'

call plug#end()

set shiftwidth=4
set expandtab
set tabstop=4
set number
syntax on
set relativenumber
" let g:onedark_termcolors = 256
" let g:dracula_italic = 0
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
let ayucolor="mirage"
colorscheme Sidonia
" let g:airline_theme='onedark'
" autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE
autocmd BufNewFile,BufRead *.ts set syntax=javascript
set guicursor=
