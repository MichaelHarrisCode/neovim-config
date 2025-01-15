lua require('config')

" Absolute numbering in insert mode, relative numbering in normal mode
set number
augroup no_insert_relative
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave * set norelativenumber
augroup END

" Splitting creates new screen on right side
set splitright

" Syntax highlighting
syntax on

" Allows filetype detection and loads plugins and indentation rules for that
" specific filetype 
filetype on
filetype plugin on
filetype indent on

" Screw you VI, we're not gonna be compatible with you!
set nocompatible

" Search options - highlights search results as I type, not case-sensitive
set incsearch
set hlsearch
set ignorecase

" Command line completion? I still don't really know what this is
set wildmenu
set wildmode=list:longest,list:full

" Shows matching parantheses, braces, etc
set showmatch 

" Allows undo even after closing and re-opening a file
set undofile

" AUTO INDENT
set autoindent
set smartindent
