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
set mouse=a                 " mouse!

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

" Searching ----------------------------
set tags=./tags,tags;       " set tags to recursively look for a tags folder
nmap <F8> :TagbarToggle<CR> " toggle tagbar

" Toggle between files
nmap <C-e> :e#<CR>

" NERDTree -----------------------------
map <F1> :NERDTreeToggle<CR>
" Use NERDTree if vim is opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Files --------------------------------
" Put plugins and dictionaries in this dir
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
   let myUndoDir = expand(vimDir . '/undodir')
   " Create dirs
   call system('mkdir ' . vimDir)
   call system('mkdir ' . myUndoDir)
   let &undodir = myUndoDir
   set undofile
endif
