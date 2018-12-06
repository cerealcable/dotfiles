" Plugins ------------------------------:
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Globals ------------------------------
let mapleader="\\"          " leader is \
" statusbar theme (airline)
let g:airline_theme='wombat'
syntax enable               " syntax processing
set number                  " line numbering
filetype plugin indent on   " load filetype specific indent files
set wildmenu                " visual autocomplete
set showmatch               " highlight matching [{()}]
set incsearch               " search as characters typed
set hlsearch                " highlight search matches
set mouse=a                 " mouse!
set encoding=UTF-8

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

" vim-markdown -------------------------
let g:vim_markdown_folding_disabled = 1

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

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" FZF, Preview and Icons
nnoremap <silent> <leader>f :call Fzf_dev()<CR>
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction
