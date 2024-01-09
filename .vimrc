" Basic settings
set nocompatible                                           " Better default settings
syntax enable                                              " Enable syntax highlighting
set encoding=utf-8                                         " Use UTF-8 encoding

" Initialize vim-plug plugin manager
call plug#begin("~/.vim/plugged")

" Add your current plugins from ~/.vimrc.plugins and ~/.vimrc.plugins.local
source ~/.vimrc.plugins
source ~/.vimrc.plugins.local

call plug#end()
filetype plugin indent on                                  " Enable filetype detection

" General settings
set autoindent                                             " Automatically indent new lines
set autoread                                               " Auto-update files changed outside Vim
set backspace=indent,eol,start                             " Make backspace behave like modern editors
set clipboard=unnamed                                      " Use system clipboard
set expandtab                                              " Convert tabs to spaces
set ignorecase                                             " Case-insensitive searching
set incsearch                                              " Show search results as you type
set list listchars=tab:▸\ ,trail:▫                         " Show tabs and trailing spaces
set number                                                 " Display line numbers
set scrolloff=3                                            " Keep 3 lines above/below the cursor
set shiftwidth=2                                           " Use 2 spaces for autoindent
set smartcase                                              " Case-sensitive search if uppercase present
set softtabstop=2                                          " Tab key inserts 2 spaces
set tabstop=4                                              " Display existing tabs as 4 spaces
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                   " Ignore these files in navigation
set wildmenu                                               " Enhanced command line completion

" Mouse and window resizing settings
set mouse=a                                                " Enable mouse support
autocmd VimResized * :wincmd =                             " Auto-balance windows on resize

" keyboard shortcuts
let mapleader = '\'
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

" use the new SnipMate parser
let g:snipMate = { 'snippet_version' : 1 }

set grepprg=rg\ --no-heading\ --line-number\ --color=never
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow -g "!.git/*"'

" Custom file type settings
augroup filetype_settings
  autocmd!
  autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.md set spell
augroup END
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  set ttymouse=xterm2
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" Go crazy!
if filereadable(expand("~/.vimrc.local"))
  " In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowritebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  " noremap! jj <ESC>
  source ~/.vimrc.local
endif
