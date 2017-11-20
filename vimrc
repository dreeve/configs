" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'gregsexton/gitv'
Plug 'nsf/gocode'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Zabanaa/neuromancer.vim'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'Valloric/YouCompleteMe'

" Initialize plugin system
call plug#end()
" :PlugInstall will install plugins

let mapleader = "\\"

""""""""""""""""""""
" fzf / File-finding
""""""""""""""""""""
autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Mapping selecting Mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Shortcuts
nnoremap <Leader>p :Files<CR> 
nnoremap <Leader>P :CtrlP<CR>
nnoremap <Leader>w :w<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)



set background=dark " for the dark version
colorscheme neuromancer
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

" Note, the above line is ignored in Neovim 0.1.5 above, use this line instead.
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Don't prompt for file changes outside vim
set autoread

" show a grey column at column 81
hi ColorColumn guifg=cyan guibg=default
set colorcolumn=80

" Start scrolling when the cursor is within 3 lines of the edge.
set scrolloff=5
" Scroll faster.
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

set backspace=2
" History Size
set history=1024

" Incremental Search
set hlsearch
set incsearch
set smartcase

" Tab Settings
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

" tab shortcuts
map <C-t><C-p> :tabprev<cr>
map <C-t><C-n> :tabnext<cr>
map <C-t><C-t> :tabnew<cr>:Files<cr>
map <C-t><C-w> :tabclose<cr>

map <Space> :noh<cr>
imap kj <Esc>:w<cr>

map <Leader>p :CtrlPClearCache<CR>
set pastetoggle=<leader><space>

" line numbers
set number
set numberwidth=5
