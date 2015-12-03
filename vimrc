set t_Co=256
set nocompatible
filetype off

" Add untracked machine-local vim path
let &rtp = "~/.vim.local,".&rtp
set rtp+=~/.vim.local

set rtp+=~/.vim/bundle/Vundle.vim

" set the runtime path to include Vundle and initialize
call vundle#begin()

" Plugins. :PluginInstall to install
Plugin 'VundleVim/Vundle.vim' " Let Vundle manage Vundle
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()

let mapleader = "\\"

syntax on
" colorscheme candycode
colorscheme Tomorrow-Night-Bright
highlight LineNr        guifg=#cccccc ctermfg=Gray

" Let unsaved buffers exist in the background.
set hidden

" Highlight current row.
set cursorline

" no wrapping
set nowrap

" Show typed command prefixes while waiting for operator.
set showcmd

" Don't time out during commands.
set notimeout

" always show statusline
set laststatus=2

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
set listchars=trail:·

function! FancyTabChar()
  set list lcs=tab:\ \ 
endfunction
" autocmd FileType otl call FancyTabChar()

autocmd BufRead,BufNewFile *.otl call FancyTabChar()

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
set foldnestmax=2
set foldlevel=1
" zz to toggle folds
map z` :set foldmethod=indent<cr>

" tab shortcuts
map <C-t><C-p> :tabprev<cr>
map <C-t><C-n> :tabnext<cr>
map <C-t><C-t> :tabnew<cr>:CtrlP<cr>
map <C-t><C-w> :tabclose<cr>

" show tab number
if exists("+showtabline")
  function MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
    let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
    let s .= ' '
      let s .= i
      let s .= ' %*'
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let file = bufname(buflist[winnr - 1])
      let file = fnamemodify(file, ':p:t')
      if file == ''
        let file = '[No Name]'
    endif
      let s .= file
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set stal=2
  set tabline=%!MyTabLine()
endif


" get rid of C-w for switching splits
map <Leader>h <C-w><C-h>
map <Leader>l <C-w><C-l>
map <Leader>j <C-w><C-j>
map <Leader>k <C-w><C-k>

" show a grey column at column 81
set colorcolumn=80
highlight ColorColumn ctermbg=black
set winwidth=82

" Add new windows towards the right and bottom.
set splitbelow splitright

map <Space> :noh<cr>
imap kj <Esc>:w<cr>

map <Leader>p :CtrlPClearCache<CR>

" use c-p/c-n to go up and down the list 
" to select alternate files in ctrlp
let g:ctrlp_prompt_mappings = {
      \ 'PrtHistory(-1)':       ['<c-j>', '<up>'],
      \ 'PrtHistory(1)':        ['<c-k>', '<down>'],
      \ 'PrtSelectMove("j")':   ['<c-n>'],
      \ 'PrtSelectMove("k")':   ['<c-p>']
      \ }


" line numbers
set rnu
:au FocusLost * :set number
:au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
set numberwidth=5

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-h> :call NumberToggle()<cr>
nnoremap <Leader>v :vsp<cr>:CtrlP<cr>

let g:Powerline_colorscheme = 'skwp'

map <C-n> :NERDTreeToggle<CR>
