call plug#begin('~/.vim/plugged')

" Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'jiangmiao/auto-pairs'
Plug 'dracula/vim'
Plug 'ayu-theme/ayu-vim'
Plug 'hauleth/blame.vim'
Plug 'tpozzi/Sidonia'
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'axvr/photon.vim'
Plug 'huyvohcmc/atlas.vim'
Plug 'tek256/simple-dark'
Plug 'jaredgorski/fogbell.vim'
Plug 'Lokaltog/vim-monotone'
Plug 'pgdouyon/vim-yin-yang'
Plug 'aditya-azad/candle-grey'
Plug 'NLKNguyen/papercolor-theme'
Plug 'reedes/vim-colors-pencil'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'kamykn/dark-theme.vim'
Plug 'jcherven/jummidark.vim'
Plug 'joshdick/onedark.vim'

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'haya14busa/incsearch.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/keith/swift.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'neovim/nvim-lspconfig'

call plug#end()

" set list listchars=tab:▸\ ,trail:•,eol:¬,extends:#,nbsp:.
" set list listchars=eol:¬
" ,tab:▸\
set ignorecase
set smartcase

" source ~/.config/nvim/statusline.vim

let mapleader = " "
set shiftwidth=4
set expandtab
set tabstop=4
set number
set relativenumber
set numberwidth=3
syntax on
set termguicolors 
set guicursor=
set background=light
set hlsearch
colorscheme pencil
set backspace=indent,eol,start
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)

set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip

" function! s:OpenProjects(file)
"     :e a:file
"     " :cd %:p:h
"     :cd a:file
" endfunction

" command! Directories call fzf#run(
"     \{
"     \'source': 'fd --type d --exclude node_modules/ --exclude Library/',
"     \'sink': function('s:OpenProjects'),
"     \})

command! Directories call fzf#run(fzf#wrap({'source': 'fd . --type d --exclude node_modules/ --exclude Library/ /Users/zach'}))

command! Setdir :cd %:p:h

" Keymappings
:tnoremap <Esc> <C-\><C-n>

" Files
nnoremap <leader>fp :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fo :Files ~<CR>
nnoremap <leader>fs :w<CR>
nnoremap <C-p> :Directories<CR>
nnoremap <leader>rr :source ~/.config/nvim/init.vim<CR>

" Buffers
nnoremap <leader>< :Buffers<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>




" Git mappings
nnoremap <leader>gs :G<CR>
nnoremap <leader>gc :GBranches<CR>


nnoremap <leader>qq :q<CR>


" let g:lightline = {
"       \ 'colorscheme': 'PaperColor',
"       \ }

" coc
"
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
  " Recently vim can merge signcolumn and number column into one
set signcolumn=number

