syn on

set autoread
set fileformat=unix
set fileformats+=mac
" scrolling
set mouse=a

"set nowrap " still not sure how i feel about linewrapping in vi!
"set showbreak=↪  " not sure how I feel about this - I don't even wrap lines anyway
set backspace=2 " set backspace=indent,eol,start; basically lets you delete most any character
set foldmethod=marker
set laststatus=2 " always display the file status bar, even in command mode
set ruler
"set nu " show line numbers - don't care for this by default, generally
set showcmd

"hi Comment ctermfg=White ctermbg=Blue guifg=#80a0ff
set cursorline " highlighted line for current cursor
"hi CursorLine cterm=NONE ctermbg=Black guibg=Black
" ^^ only works for dark backgrounds

" incremental, case-insentive search
set ignorecase
set incsearch
filetype indent on


" default to using tabs, which span 4 columns
set tabstop=4 shiftwidth=4

" 4 spaces for Social Reader
autocmd BufNewFile,BufRead ~/labs/facebook-trove/* set expandtab tabstop=4 shiftwidth=4 softtabstop=4
" 2 spaces for MonetaJS
autocmd BufNewFile,BufRead ~/labs/monetajs/* set expandtab tabstop=2 shiftwidth=2 softtabstop=2


if has('autocmd')
	filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
	syntax enable
endif

if has('autocmd')
	filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
	syntax enable
endif

" delete trailing whitespace on save
if has('autocmd')
    autocmd BufWritePre * :%s/\s\+$//e
endif

" also highlight bad whitespace
if has('autocmd')
    highlight ExtraWhitespace ctermbg=darkred guibg=darkred
    match ExtraWhitespace /\s\+$\| \+\ze\t/
    autocmd InsertLeave * redraw!
endif


set autoindent
set backspace=indent,eol,start
"set complete-=i
set showmatch
set smarttab

"set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set ignorecase      " ignore case in search
set incsearch       " do incremental searching

set showcmd
" make tab completion of file names in command mode more like bash: http://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list,full
set wildmenu


if !&scrolloff
	set scrolloff=1
endif
if !&sidescrolloff
	set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
	set encoding=utf-8
endif


if &listchars ==# 'eol:$'
	set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
	if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
		let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
	endif
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
Bundle "scrooloose/nerdtree"

" start nerdtree when opening vim w/o a file
autocmd vimenter * if !argc() | NERDTree | endif

" close vim if nerdtree is the only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"Bundle "Lokaltog/vim-powerline"

" for ternjs.. need a newer vim first
"let g:ycm_path_to_python_interpreter = "/Users/jz/.pyenv/shims/python"
"Bundle "Valloric/YouCompleteMe"
"Bundle "marijnh/tern_for_vim"

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
