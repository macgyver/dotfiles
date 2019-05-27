syn on

set autoread
set fileformat=unix
set fileformats+=mac
" scrolling
"set mouse=a
set number

"set nowrap " still not sure how i feel about linewrapping in vi!
"set showbreak=↪  " not sure how I feel about this - I don't even wrap lines anyway
set backspace=2 " set backspace=indent,eol,start; basically lets you delete most any character
set foldmethod=marker
set laststatus=2 " always display the file status bar, even in command mode
set ruler
"set nu " show line numbers - don't care for this by default, generally
set showcmd

set t_Co=512   " 256 color mode fcks up my yellows, but somehow this works..
"hi Comment ctermfg=White ctermbg=Blue guifg=#80a0ff
set cursorline " highlighted line for current cursor
"hi CursorLine cterm=NONE ctermbg=Black guibg=Black
" ^^ only works for dark backgrounds

" incremental, case-insentive search
set ignorecase
set incsearch

" default to using tabs, which span 8 columns
set autoindent smarttab noexpandtab copyindent preserveindent softtabstop=0 shiftwidth=8 tabstop=8
" 4 spaces for Social Reader
"autocmd BufNewFile,BufRead ~/labs/facebook-trove/* set expandtab tabstop=4 shiftwidth=4 softtabstop=4
" 2 spaces for MonetaJS
"autocmd BufNewFile,BufRead ~/labs/monetajs/* set expandtab tabstop=2 shiftwidth=2 softtabstop=2

filetype indent on
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


set backspace=indent,eol,start
"set complete-=i
set showmatch

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

"set nocompatible              " be iMproved, required

call plug#begin('~/.vim/bundle')
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" for YouCompleteMe. need a newer vim first
"let g:ycm_path_to_python_interpreter = "/Users/jz/.pyenv/shims/python"
Plug 'Valloric/YouCompleteMe'
Plug 'marijnh/tern_for_vim'
"Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
let g:ale_fixers = ['prettier', 'eslint']
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

call plug#end()
