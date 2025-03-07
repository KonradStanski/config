"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      VIM CONFIGURATION                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" install vim-plug plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
   silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"install plugins
call plug#begin()
Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'

if stridx(&runtimepath, expand(vimDir)) == -1
  " vimDir is not on runtimepath, add it
  let &runtimepath.=','.vimDir
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Fix cursor blinking and inert mode exit delay
so ~/.vim/plugin/togglecursor.vim
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

" Set status bar color on insert
augroup StatusLine
  autocmd!
  autocmd InsertEnter * highlight StatusLine ctermfg=white ctermbg=blue
  autocmd InsertLeave * highlight StatusLine ctermfg=white ctermbg=darkgray
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                    BASIC CONFIGURATION                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set compatibility to Vim only.
set nocompatible

set cursorline
"Encoding
set encoding=utf-8

"enable actual color in tmux
set background=dark

"Show line numbers
set number

"Show tab line with only 1 tab
set showtabline=2

"Show matching brackets.
set showmatch
set matchpairs+=<:>

"set wildmenu for command completion"
set wildmenu

"Show (partial) command in status line.
set showcmd

"Enable mouse usage (all modes)
set mouse=a

"Turn on syntax highlighting.
syntax enable
colorscheme monokai

"Status bar
set laststatus=2

"Allow end of line editing
set virtualedit+=onemore

"Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Set status line display
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

"Speed up scrolling in Vim
set ttyfast

"Hide buffers when they are abandoned
set hidden

"Dont Wrap text
set nowrap

"Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
"set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

"""""""""""""""""""""
" Command Bar Color "
"""""""""""""""""""""
augroup StatusLine
  autocmd!
  autocmd InsertEnter * highlight StatusLine ctermfg=white ctermbg=blue
  autocmd InsertLeave * highlight StatusLine ctermfg=white ctermbg=darkgray
augroup END



"Display 5 lines above/below the cursor when scrolling with a mouse.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     KEYBINDINGS                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap jj <Esc>
vnoremap <silent> jt :!python3 /Users/konrad/bin/relaxed_json.py<CR>
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
nnoremap gf <C-w>gF
nnoremap <C-E> <C-^>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          MATCHING                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Do case insensitive matching
set ignorecase
"Highlight matching search patterns
set hlsearch
"Enable incremental search
set incsearch
"Include matching uppercase words with lowercase search term
set ignorecase
"Include only uppercase words with uppercase search term
set smartcase

set scrolloff=20
" Fixes common backspace problems
set backspace=indent,eol,start

"Display options
set showmode

"Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

"Auto reload config
autocmd BufWritePost .vimrc source %
