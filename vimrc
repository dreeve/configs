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
set nowrap
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
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.svn

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
  filetype plugin indent on

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

set wildmode=longest:full
set wildmenu

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
