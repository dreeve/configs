let mapleader = ","
" Add all directories under $DOTFILES/vim/vendor as runtime paths, so plugins,
" docs, colors, and other runtime files are loaded.
" stolen from ryankinderman/dotfiles
let vendorpaths = globpath("$DOTFILES/vim", "vendor/*")
let vendorruntimepaths = substitute(vendorpaths, "\n", ",", "g")
let vendorpathslist = split(vendorpaths, "\n")
execute "set runtimepath^=$DOTFILES/vim,".vendorruntimepaths
for vendorpath in vendorpathslist
  if isdirectory(vendorpath."/doc")
    execute "helptags ".vendorpath."/doc"
  endif
endfor

filetype on  " Automatically detect file types.
set nocompatible  " We don't want vi compatibility.
 
" Add recently accessed projects menu (project plugin)
set viminfo^=!
 
" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
 
" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

map ,m <ESC>:FufFile<CR>
 
" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'
 
syntax enable

set nu            " show line numbers
set sw=2          " set shiftwidth to 2
set ts=2          " set number of spaces for a tab to 2
set et            " expand tabs to spaces
" Whitespace stuff
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
"set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildchar=<Tab>
set wildmode=full
set wildignore+=*.o,*.obj,.git,*.rbc,.svn
set wildmenu

" Switch syntax highlighting on, when the terminal has colors
" " Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " For all ruby files, set 'shiftwidth' and 'tabspace' to 2 and expand tabs
  " to spaces.
  autocmd FileType ruby,eruby set sw=2 ts=2 et

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" colorscheme brookstream
colorscheme candycode

" I hate you, gui! I just want to use my mouse sometimes!
set guioptions-=T " disables toolbar
set guioptions-=m " disables menubar
set guioptions-=lrb
set guioptions=


set hidden " enable multiple buffers to be opened without saving
set ruler

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

"folding settings
set foldmethod=indent
set foldnestmax=2
set nofoldenable 
set foldlevel=1
set foldcolumn=2

" Folding *********************************************************************
function! EnableFolding()
  "set foldcolumn=4
  set foldcolumn=2
  set foldenable
endfunction
function! DisableFolding()
  set foldcolumn=0
  set nofoldenable
endfunction
call DisableFolding()

" as much as I like autoloading views, this causes problems with rails.vim
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
compiler ruby         " Enable compiler support for ruby

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/', 'index': 'index'}]


function! RunSpec(command)
  if a:command == ''
    let dir = 'spec'
  else
    let dir = a:command
  endif
  cexpr system("spec -r ~/Dropbox/tools/vim_formatter -f Spec::Runner::Formatter::VimFormatter " . dir)
  cw
endfunction

command! -nargs=? -complete=file Spec call RunSpec(<q-args>)
map <leader>s :Spec<space>

set guifont=Monaco\ 10
" switch between most recent and current buffers
nnoremap <leader>. <c-^>
" switch between open splits
nmap <leader>/ <c-w>w

let g:bufmru_switchkey = "<Space>"
