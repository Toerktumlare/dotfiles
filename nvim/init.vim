set shell=/bin/bash

set rtp+=~~/.local/share/nvim/site/pack/plugins/start
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'frazrepo/vim-rainbow'
Plug 'justinmk/vim-sneak'
Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> { fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

call plug#end()

" packadd! dracula-theme
colorscheme dracula

set encoding=utf-8
set fileencodings=utf-8

" Settings needed for .lvimrc
set exrc
set secure

syntax on

filetype plugin on
set omnifunc=syntaxcomplete#Complete

if (has("termguicolors"))
 set termguicolors
endif

set tabstop=4
set shiftwidth=4 " new line indentation
set expandtab " tab to spaces
set softtabstop=4
set autoindent " indent on new line

set cursorline " highlight current working line
set showmatch " higlight matching ({[]})
set incsearch " search as chars are entered
set hlsearch " highlight search results
set noswapfile " set swapfile and location
set relativenumber
set number " set line numbers
set noshowmode " remove --INSERT-- text
set scrolloff=2 " scroll offset so we can see below the cursor
set nojoinspaces " when joining lines dont add a space

" ------ Airline config
let g:airline_theme = 'dracula'
let g:airline_left_sep = " ▶ "
let g:airline_right_sep = " ◀ "
let g:airline_section_x = ""
let g:airline_section_y = ""
let g:airline_section_warning=""

let g:rainbow_active=1 " activate vim-rainbow brackets

" NerdTree toggle
map <c-b> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" map ctrp to fzf
map <c-p> :Files<CR>

" Sane splits
set splitright
set splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Ctrl+h to stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
