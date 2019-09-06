" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" ---------------------------------------------------------------------- Plugins
" Use :PlugInstall to install plugins

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-endwise'
Plug 'tomtom/tcomment_vim'
Plug 'itchyny/lightline.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'dhruvasagar/vim-zoom'
Plug 'nelstrom/vim-visual-star-search'
Plug 'mtth/scratch.vim'
Plug 'vim-pandoc/vim-markdownfootnotes'

" Plugins that interact with other applications
Plug 'janko-m/vim-test'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'gabesoft/vim-ags'
Plug 'rizzatti/dash.vim'
Plug 'mhinz/vim-signify'

" Plugins that are language-specific
Plug 'nsf/gocode'
Plug 'fatih/vim-go'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-markdown'

" Themes
Plug 'nanotech/jellybeans.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'mhartington/oceanic-next'
Plug 'chriskempson/base16-vim'
Plug 'zeis/vim-kolor'

" Initialize plugin system
call plug#end()


" Colors, themes, and UI settings

set background=dark
colorscheme base16-eighties
let g:lightline = {
	\ 'colorscheme': 'Tomorrow_Night_Eighties',
	\ }

set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Show a grey column at column 81
hi ColorColumn guifg=cyan guibg=default
set colorcolumn=80

highlight Comment ctermfg=888888
highlight LineNr ctermfg=888888
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" --------------------------------------------------------------------- Settings

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
set numberwidth=3
set nowrap

" Folding
set foldmethod=manual
" set foldlevel=99

" Markdown options
highlight clear markdownCodeBlock  " Don't highlight every line starting with 4 spaces.
autocmd FileType markdown setlocal nospell
set conceallevel=2
set concealcursor="nc"

" ctrlp
let g:ctrlp_working_path_mode = 0  " Allows ctrlp to change base directory
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" Use rg for ctrlp file indexing
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

let g:signify_vcs_list = [ 'git' ]

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
" (source: thoughtbot's dotfiles)
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"


" --------------------------------------------------------------------- Mappings

" Set leader to backslash
let mapleader = "\\"

" Space in normal mode does :nohighlight and saves the file
nmap <Space> :noh<CR>:w<CR>:echo ''<CR>

" F3 to open vimrc in a new tab
nmap <F3> :tabe $MYVIMRC<cr>
" F4 to reindex tags
nmap <F4> :call ReindexCtags()<cr>

" Copy to system clipboard
noremap <Leader>y "*y
noremap Y "*y
noremap <Leader>p "*p
noremap <Leader>P "*p

" Scroll faster.
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Tab Management
map <C-t><C-p> :tabprev<cr>
map <C-t><C-n> :tabnext<cr>
map <C-t><C-t> :tabnew<cr>:CtrlP<cr>
map <C-t><C-w> :tabclose<cr>

" File Management / ctrlp / NERDtree
map <Leader>p :CtrlPClearCache<CR>
map <Leader>v :vsp<CR>:CtrlP<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind %<CR>

" vim-test
nmap <silent> <Leader>t :TestNearest<CR>
nmap <silent> <Leader>T :TestFile<CR>
nmap <silent> <Leader>l :TestLast<CR>

if has('nvim')
  " Use C-o to allow scrolling in a terminal window
  tmap <C-o> <C-\><C-n>
end

" vim-fugitive
nmap <Leader>g :Gblame<CR>
nmap <Leader>d :Gdiff<CR>

" searching / vim-ags
" Map leader slash to search for text under cursor
nnoremap <leader>/ :exe 'Ags' expand('<cword>')<cr>

" Jump to previous buffer
nnoremap <Leader><Leader> <C-^>


" -------------------------------------------------------------------- Functions

" Index ctags from any project, including those outside Rails
function! ReindexCtags()
  let l:ctags_hook = '$(git rev-parse --show-toplevel)/.git/hooks/ctags'

  if exists(l:ctags_hook)
    exec '!'. l:ctags_hook
  else
    exec "!ctags -R --exclude='*.js' ."
  endif
endfunction

" Automatically save/load folds
augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end
