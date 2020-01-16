" Vim conf by Max Solovyev

" Cancel the compatibility with Vi.
set nocompatible

"-----------------------------------------------------------------------

" NERDtree plugin settings

"-----------------------------------------------------------------------

" Autostart nertree whem vim launch without any files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Start nerdtree when vim open dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close nerdtree if only one left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Hotkey Ctrl+n toggle nertree
map <C-n> :NERDTreeToggle<CR>

" \ + f to show file in nerdtree
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" Close nertfree when open a file
let NERDTreeQuitOnOpen = 1

" Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1

" Prettify
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"-----------------------------------------------------------------------

" -- Display
set title                 " Update the title of your window or your terminal
set number                " Display line numbers
set ruler                 " Display cursor position
set wrap                  " Wrap lines when they are too long
set guioptions=T          " Enable the toolbar
set showmode              " Show mode in bottom
set scrolloff=3           " Display at least 3 lines around you cursor
                          " (for scrolling)

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


"-----------------------------------------------------------------------

" Cool hotkeys

"-----------------------------------------------------------------------

" Copy the relative path of the current file to the clipboard
nmap <Leader>cf :silent !echo -n % \| pbcopy<Enter>

" Press the j 2 times in row
:imap jj <Esc>
" Press ;; for escape 
:imap ;; <Esc>
let mapleader=" "
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Ident and tabs
set shiftwidth=2
set tabstop=2
" Tab to space
set expandtab
set smarttab
" Show tabs 
set list
set listchars=tab:>-

" Cool stuff for correct paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

"-----------------------------------------------------------------------

" Status line stuff

"-----------------------------------------------------------------------
set laststatus=2
set statusline=%f " tail of the filename
