"BASICS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
syntax on

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
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

"Speed up scrolling in Vim
set ttyfast

"Hide buffers when they are abandoned
set hidden

"Dont Wrap text
set nowrap

"KEYBINDINGS""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"MATCHING"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
"set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

"Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

"Display options
set showmode

"Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

"Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

