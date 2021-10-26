syntax on
set nocompatible
set backspace=indent,eol,start
set autoindent
set hidden
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set nowrap

"change search behavior
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch

"tab settings
set tabstop=2
set shiftwidth=2
set expandtab
let &softtabstop = &shiftwidth

"line numbering
set relativenumber
set number

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

"Auto-apply chezmoi edits
autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"
