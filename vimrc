" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" -------- Plugins
" Use :PlugInstall to install plugins

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-endwise'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ajh17/VimCompletesMe'

" Plugins that interact with other applications
Plug 'janko-m/vim-test'
Plug 'tpope/vim-fugitive'
Plug 'gabesoft/vim-ags'
Plug 'ludovicchabant/vim-gutentags'

" Plugins that are language-specific
Plug 'nsf/gocode'
Plug 'fatih/vim-go'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'thoughtbot/vim-rspec'

" Themes
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-colors-rakr'
Plug 'rakr/vim-two-firewatch'
Plug 'vim-scripts/moria'
Plug 'xero/sourcerer.vim'
Plug 'christophermca/meta5'

" Initialize plugin system
call plug#end()


" Colors, themes, and UI settings

set background=dark
colorscheme moria
let g:airline_theme = 'bubblegum' "let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Show a grey column at column 81
hi ColorColumn guifg=cyan guibg=default
set colorcolumn=80


" -------- Settings

" Don't prompt for file changes outside vim
set autoread

" Make backspace in insert mode work like normal applications
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

" Split Settings
set splitright
set splitbelow

" Never make a swap file
set nobackup
set nowritebackup
set noswapfile

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

set pastetoggle=<leader><space>

" Start scrolling when the cursor is within 5 lines of the edge.
set scrolloff=5

" Line Numbers
set number
set numberwidth=5
set nowrap

" Folding
set foldmethod=syntax
set foldlevel=99


" -------- Mappings

" Scroll faster.
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" tab shortcuts
map <C-t><C-p> :tabprev<cr>
map <C-t><C-n> :tabnext<cr>
map <C-t><C-t> :tabnew<cr>:CtrlP<cr>
map <C-t><C-w> :tabclose<cr>

" Set leader to backslash
let mapleader = "\\"
map <Space> :noh<cr>

map <Leader>p :CtrlPClearCache<CR>
map <Leader>v :vsp<CR>:CtrlP<CR>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
if executable('rg')
  set grepprg=rg--color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

map <Leader>n :NERDTreeToggle<CR>

" vim-test
nmap <silent> <Leader>t :TestNearest<CR>
nmap <silent> <Leader>T :TestFile<CR>
nmap <silent> <Leader>l :TestLast<CR>

if has('nvim')
  " Use C-o to allow scrolling in a terminal window
  tmap <C-o> <C-\><C-n>
end

" Hit F1 to open vimrc in a new tab
nmap <F1> :tabe $MYVIMRC<cr>

" Map leader slash to search for text under cursor
nnoremap <leader>/ :exe 'Ags' expand('<cword>')<cr>
