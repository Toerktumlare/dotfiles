set exrc " source vimrc in present folder
set secure " restrict local vimrc's

set encoding=utf-8
set fileencodings=utf-8

syntax on

set omnifunc=syntaxcomplete#Complete " enable intellisense

" ------ Dracula config
let g:dracula_colorterm=0 " needed to set background to black

packadd! dracula-theme
colorscheme dracula

set tabstop=4
set shiftwidth=4 " new line indentation
set expandtab " tab to spaces
set softtabstop=4

set cursorline " highlight current working line
set showmatch " higlight matching ({[]})
set incsearch " search as chars are entered
set hlsearch " highlight search results
set swapfile " set swapfile and location
set dir=~/tmp
set number " set line numbers

" ------ Airline config
let g:airline_theme = 'dracula'
let g:airline_left_sep = " ▶ "
let g:airline_right_sep = " ◀ "
let g:airline_section_x = ""
let g:airline_section_y = ""
let g:airline_section_warning=""

set laststatus=2


" =========================================
" Mappings
" =========================================

" NerdTree toggle
map <c-b> :NERDTreeToggle<CR>

