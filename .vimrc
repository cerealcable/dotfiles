" Plugins ------------------------------:
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Globals ------------------------------
let mapleader="\\"          " leader is \
" statusbar theme (airline)
let g:airline_theme='wombat'
syntax enable               " syntax processing
set number                  " line numbering
filetype indent on          " load filetype specific indent files
set wildmenu                " visual autocomplete
set showmatch               " highlight matching [{()}]
set incsearch               " search as characters typed
set hlsearch                " highlight search matches

" Space & Tabs -------------------------
set tabstop=4               " tab size
set softtabstop=4           " tab size
set expandtab               " tab expansion

" Whitespace ---------------------------
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,
set list

" Maps ---------------------------------
"   clear search matches with <leader><space>
nnoremap <leader><space> :nohlsearch<CR>
"   remove whitespace at end of lines
map <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
"   source vimrc
map <leader>sv :source $MYVIMRC<CR>

