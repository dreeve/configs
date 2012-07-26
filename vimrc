" Add untracked machine-local vim path
let &rtp = "~/.vim.local,".&rtp

let mapleader = ","

syntax on
" colorscheme candycode
colorscheme Tomorrow-Night-Bright
highlight LineNr        guifg=#cccccc ctermfg=Gray
set nocompatible

" Let unsaved buffers exist in the background.
set hidden

" Highlight current row.
set cursorline

" no wrapping
set nowrap

" line numbers
set number

" Show typed command prefixes while waiting for operator.
set showcmd

" Don't time out during commands.
set notimeout

" always show statusline
set laststatus=2

" pathogen
call pathogen#infect()
filetype plugin on
filetype indent on

" Don't prompt for file changes outside vim
set autoread

"strip trailing whitespace on save for code files
function! StripTrailingWhitespace()
  let save_cursor = getpos(".")
  %s/\s\+$//e
  call setpos('.', save_cursor)
endfunction
" rails
autocmd BufWritePre *.rb,*.yml,*.js,*.css,*.less,*.sass,*.scss,*.html,*.xml,*.erb,*.haml call StripTrailingWhitespace()
" misc
autocmd BufWritePre *.java,*.php,*.feature call StripTrailingWhitespace()

" highlight JSON files as javascript
autocmd BufRead,BufNewFile *.json set filetype=javascript

" Show whitespace, fullstops for trailing whitespace
set list
if has("gui_running")
  set listchars=trail:·
else
  set listchars=trail:~
endif

" Swapfiles
set swapfile

" Keep swap and backup files somewhere else
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp

" history size
set history=1024

" incremental search
set hlsearch
set incsearch
set smartcase

" show matching brackets
set showmatch

" tab settings
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

" tab completion
set wildchar=<Tab>
set wildmode=full
set wildignore+=*.o,*.obj,.git,*/.git/*,*.rbc,.svn
set wildmenu

" Allow backspace to work more flexibly.
set backspace=2

" set question mark to be part of a VIM word. in Ruby it is!
autocmd FileType ruby set iskeyword=@,48-57,_,?,!,192-255
autocmd FileType scss set iskeyword=@,48-57,_,-,?,!,192-255

" Write all writeable buffers when changing buffers or losing focus.
autocmd BufLeave,FocusLost * silent! wall
set autowriteall

" Start scrolling when the cursor is within 3 lines of the edge.
set scrolloff=3

" Scroll faster.
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" folding
set foldmethod=indent
set foldnestmax=3
set foldlevel=2
" zz to toggle folds
map zz za
map z` :set foldmethod=indent<CR>

" tab shortcuts
map <C-t><C-p> :tabprev<CR>
map <C-t><C-n> :tabnext<CR>
map <C-t><C-t> :tabnew<CR>
map <C-t><C-w> :tabclose<CR>

" show a grey column at column 81
set colorcolumn=81
highlight ColorColumn ctermbg=darkgray
set winwidth=82

" Add new windows towards the right and bottom.
set splitbelow splitright

map <Space> :noh<cr>
imap jj <Esc>

" use c-p/c-n to go up and down the list 
" to select alternate files in ctrlp
let g:ctrlp_prompt_mappings = {
      \ 'PrtHistory(-1)':       ['<c-j>', '<up>'],
      \ 'PrtHistory(1)':        ['<c-k>', '<down>'],
      \ 'PrtSelectMove("j")':   ['<c-n>'],
      \ 'PrtSelectMove("k")':   ['<c-p>']
      \ }