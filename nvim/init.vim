set shell=/bin/bash
let mapleader = "\<Space>"


set rtp+=~~/.local/share/nvim/site/pack/plugins/start
call plug#begin()

" GUI enhancements
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'frazrepo/vim-rainbow'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'

"VIM enhancements
Plug 'justinmk/vim-sneak'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { ->  fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Semantic languge support
Plug 'neoclide/coc.nvim' , { 'branch': 'release' }

" Syntactic languge support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'dag/vim-fish'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'

call plug#end()

" packadd! dracula-theme
colorscheme dracula

set encoding=utf-8
set fileencodings=utf-8

" Settings needed for .lvimrc
set exrc
set secure

syntax enable
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

if (has("termguicolors"))
 set termguicolors
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

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

" setting sane splits, will now default split right and below
set splitright
set splitbelow

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

" Map escape to Ctrl + j and Ctrl + k
nnoremap <C-j> <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
cnoremap <C-j> <C-c>
onoremap <C-j> <Esc>
lnoremap <C-j> <Esc>
tnoremap <C-j> <Esc>

nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <C-c>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

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

" Suspend with Ctrl+f return with fg
inoremap <C-f> :sus<cr>
vnoremap <C-f> :sus<cr>
nnoremap <C-f> :sus<cr>

" jump to last row after paste
vnoremap <silent> y y`]
vnoremap <silent> p p`]
vnoremap <silent> p p`]

" rust settings
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" Completion
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" scroll offset
set scrolloff=2

" wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

set relativenumber
set number

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>
