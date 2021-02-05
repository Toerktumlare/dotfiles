
set rtp+=~/.fzf " set runtime path to find fzf

set exrc " source vimrc in present folder
set secure " restrict local vimrc's

set encoding=utf-8
set fileencodings=utf-8

syntax on

filetype plugin on

set omnifunc=syntaxcomplete#Complete " enable intellisense

" ------ Dracula config
" let g:dracula_colorterm=0 " needed to set background to black

" packadd! dracula-theme
" colorscheme dracula

" ------ Material Theme
let g:material_theme_style = 'palenight'
colorscheme material

if(has('termguicolors'))
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
set number " set line numbers
set noshowmode " remove --INSERT-- text

" ------ Airline config
let g:airline_theme = 'dracula'
let g:airline_left_sep = " ▶ "
let g:airline_right_sep = " ◀ "
let g:airline_section_x = ""
let g:airline_section_y = ""
let g:airline_section_warning=""

let g:rainbow_active=1 " activate vim-rainbow brackets

set laststatus=2

" ------ NerdTree config
let NERDTreeShowHidden=1
filetype plugin indent on " activate indentation plugin for filetypes

" =========================================
" Mappings
" =========================================
let mapleader=","

" NerdTree toggle
map <c-b> :NERDTreeToggle<CR>

" map ctrp to fzf
map <c-p> :Files<CR>
