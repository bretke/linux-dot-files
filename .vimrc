"
" Bret's .vimrc file
" Version: 0.4
" Date: 2013_07_25
"
""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""
" GENERAL 
""""""""""""""""""""""""""""""""
set nocompatible        " Use Vim defaults (much better!) must be first

set history=50          " keep 50 lines of command line history

set number              " show line numbers

" Enable filetype plugins
filetype plugin on
filetype indent on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader   = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

""""""""""""""""""""""""""""""""
" VIM user interface
""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" show the cursor position all the time
set ruler

" Height of the command bar
set cmdheight=2

" File tabs always visible
set showtabline=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
""set noerrorbells
""set novisualbell
""set t_vb=
""set tm=500


""""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

colorscheme morning
"set background=light


""""""""""""""""""""""""""""""""
" Files, backups and undo
""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile



""""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""""
" Don't use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""""
" Moving around, tabs, windows, and buffers
""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

:map <C-t> :tabnew<cr>

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup bret
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

" read/write a .viminfo file, don't store more than 50 lines of registers
set viminfo='20,\"50 


""""""""""""""""""""""""""""""""
" Status Line
""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" show current mode at bottom
set showmode

" Format the status line
set statusline=%t[       "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=[size:%{FileSize()}]   "list file size, via function
set statusline+=%=      "left/right separator
set statusline+=[%c]     "cursor column
set statusline+=[%l/%L]   "cursor line/total lines
set statusline+=[%P]    "percent through file

""""""""""""""""""""""""""""""""
set bs=indent,eol,start         " allow backspacing over everything in insert mode

""""""""""""""""""""""""""""""""
" Helper Functions
""""""""""""""""""""""""""""""""
function! FileSize()
  let bytes = getfsize(expand("%:p"))
  if bytes <= 0
    return ""
  endif
  if bytes < 1024
    return bytes
  else
    return (bytes / 1024) . "K"
  endif
endfunction
