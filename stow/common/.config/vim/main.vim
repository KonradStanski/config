"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      VIM CONFIGURATION                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &term =~ "xterm\\|rxvt"
  " Vertical line in insert mode (non-blinking)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  " Block in normal mode (non-blinking)
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  " Underline in replace mode (non-blinking)
endif

autocmd VimLeave * silent !echo -ne "\<Esc>]50;CursorShape=0\x7"

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                    BASIC CONFIGURATION                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Encoding
set encoding=utf-8

"enable actual color in tmux
set background=dark

"Show line numbers
set number

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

"Set compatibility to Vim only.
set nocompatible

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

"Display 5 lines above/below the cursor when scrolling with a mouse.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     KEYBINDINGS                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
