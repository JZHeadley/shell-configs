" Have to set shell to use fish otherwise things break
" set shell=/bin/bash

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
" Added NERDTree
Plug 'scrooloose/nerdtree'

" Added NERDCommenter
Plug 'scrooloose/nerdcommenter'

" Added Vim-AutoFormat
Plug 'Chiel92/vim-autoformat'

" YouCompleteMe Plug for Code Completion
Plug 'valloric/youcompleteme'

" Adds some nice vim defaults
Plug 'tpope/vim-sensible'

" Adventurous Theme based off of dracula Theme
Plug 'philpl/vim-adventurous'

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" For the wonderful undo window
Plug 'sjl/gundo.vim'

" Shows git changes in gutter
Plug 'airblade/vim-gitgutter'

" Syntax checking
Plug 'scrooloose/syntastic'

" Rust syntax highlighting
Plug 'rust-lang/rust.vim'

" Wakatime
Plug 'wakatime/vim-wakatime'

call plug#end()


filetype plugin indent on    " required
filetype plugin on

" Sets vim's temp files to be in your home directory instead of whatever
" directory you're currently in
set swapfile
set dir=~/.vim/swap

" Sets syntax highlighting and line numbers on
syntax on " Syntax highlighting
set number " Set line numbers
set linebreak " Break lines at word (requires Wrap lines)
set showmatch  " Highlight matching brace
set hlsearch " Highlight all search results
set smartcase " Enable smart-case search
set ignorecase " Always case-insensitive
set incsearch " Searches for strings incrementally as you type

" Whitespace
set autoindent " Auto-indent new lines
set shiftwidth=4 " number of auto-indent spaces
set expandtab " use Spaces instead of tabs
set smartindent " enable smart-indent
set smarttab " enable smart-tabs
set softtabstop=4 " number of spaces per Tab
set ruler
set backspace=indent,eol,start
set undolevels=1000
set hidden
set foldenable
set mouse=a
set showcmd


"""""""""""""""
"  Interface  "
"""""""""""""""

" Set color scheme
colorscheme adventurous
set t_Co=256
set background=dark

" Vim-Airline Plugin
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" Set YouCompleteMe menu colors
highlight Pmenu ctermfg=2 ctermbg=238 guifg=#000000 guibg=#222222


" Close vim if only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"""""""""""""""""""""
"  Plugin Settings  "
"""""""""""""""""""""

" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1

" GitGutter
let g:gitgutter_realtime = 1
let g:gitgutter_grep_command = 'rg'

let g:rustfmt_autosave = 1

"""""""""""""""""""
"   Key Bindings  "
"""""""""""""""""""
let mapleader = ","

noremap <C-f> :Autoformat<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <leader>f :nohlsearch<CR>
nnoremap <C-f> :Autoformat<CR>
nnoremap <C-/> :NERDComToggleComment



" CTRL-Tab is next tab
noremap <C-Tab> :<C-U>tabnext<CR>
inoremap <C-Tab> <C-\><C-N>:tabnext<CR>
cnoremap <C-Tab> <C-C>:tabnext<CR>

" CTRL-SHIFT-Tab is previous tab
noremap <C-S-Tab> :<C-U>tabprevious<CR>
inoremap <C-S-Tab> <C-\><C-N>:tabprevious<CR>
cnoremap <C-S-Tab> <C-C>:tabprevious<CR>

nnoremap <C-t> :tabnew<CR>
inoremap <C-t> :tabnew<CR>

" Autoformat on fileSave
autocmd FileType * if &ft!="yaml" | BufWrite * :Autoformat
autocmd FileType c map <F3> :!make <CR>
autocmd FileType c map <F4> :!make run<CR>
autocmd FileType c map <F5> :!make clean<CR>

