"Vim conf by Max Solovyev
" Cancel the compatibility with Vi. Essential if you want
" to enjoy the features of Vim
set nocompatible

"execute pathogen#infect()
"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd w
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -- Display
set title                 " Update the title of your window or your terminal
set number                " Display line numbers
set ruler                 " Display cursor position
set wrap                  " Wrap lines when they are too long

set scrolloff=3           " Display at least 3 lines around you cursor
                          " (for scrolling)

set guioptions=T          " Enable the toolbar

" -- Search
set ignorecase            " Ignore case when searching
set smartcase             " If there is an uppercase in your search term
                          " search case sensitive again
set incsearch             " Highlight search results when typing
set hlsearch              " Highlight search results

" -- Beep
set visualbell            " Prevent Vim from beeping
set noerrorbells          " Prevent Vim from beeping

" Backspace behaves as expected
set backspace=indent,eol,start

" Hide buffer (file) instead of abandoning when switching
" to another buffer
set hidden

" Enable syntax highlighting
syntax enable
" Enable file specific behavior like syntax highlighting and indentation
filetype on
filetype plugin on
filetype indent on

"set background=dark
"colorscheme solarized8_high

set guifont=DejaVu\ Sans\ Mono\ 14
set antialias

" Press the j 2 times in row
:imap jj <Esc>
" Press the j key followed by the k one
:imap jk <Esc>
" Press the i 2 times in row
:imap ii <Esc>

:imap ;; <Esc>

set shiftwidth=2
set tabstop=2
set expandtab
set smarttab
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
