"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Use paothgen for managing plugins
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


"Get out of VI's compatible mode..
set nocp

"Make backspace work all the time
set bs=2

"Sets how many lines of history VIM har to remember
set history=400

"Enable filetype plugin
filetype plugin on
filetype indent on

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

"Set path for .swp files and ~ files
set directory=~/.vimtmp
set backupdir=~/.vimtmp

"Set viminfo 
set viminfo='20,<50,s10,h,!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable

"Set font to Monaco 10pt
set gfn=Droid\ Sans\ Mono\ 9

" Theme selection
if has("gui_running")
  	colorscheme molokai
	set guioptions=aAcem
else
	set t_Co=256
  	colorscheme molokai
endif

" Highlight current line in gvim
if has("gui_running")
	set cursorline
else
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn on wildmenu
set wildmenu

" Always show current position
set ruler

" No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

" Show matching braces
set showmatch

" Show Line Numbers in GUI by default
if has("gui_running")
  set nu
endif

" Quick toggle of line numbers
map <leader>l :set nu!<cr>

"Set backspace
set backspace=eol,start,indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving Around
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>tl :tabnext<cr>
map <leader>th :tabprevious<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
try
  set switchbuf=usetab
  set stal=2
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Switch to current dir
" map <leader>cd :cd %:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=4
set tabstop=4
set softtabstop=4

au FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
	""""""""""""""""""""""""""""""""
	" For Minibuffer
	""""""""""""""""""""""""""""""""
	let g:bufExplorerSortBy = "name"
	map <leader>Be :BufExplorer<cr>
	map <leader>Bs :SBufExplorer<cr>
	map <leader>Bv :VSBufExplorer<cr>

	""""""""""""""""""""""""""""""""
	" For Yankring
	""""""""""""""""""""""""""""""""
	map <leader>y :YRShow<cr>
	
	""""""""""""""""""""""""""""""""
	" For NERDTree
	""""""""""""""""""""""""""""""""
	map <leader>ne :NERDTree<cr>
	
	""""""""""""""""""""""""""""""""
	" For Ack
	""""""""""""""""""""""""""""""""
	map <leader>f :Ack 
	
	""""""""""""""""""""""""""""""""
	" For Taglist
	""""""""""""""""""""""""""""""""
	map <leader>T :Tlist<cr> 
	map <Leader>rt :!ctags --extra=+f -R *<cr><cr>

	""""""""""""""""""""""""""""""""
	" For VimWiki
	""""""""""""""""""""""""""""""""
	let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]

	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Specific Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold up interface.conf by default
autocmd BufRead interface.conf set foldmethod=marker
autocmd BufRead interface.conf set foldmarker={,}

autocmd BufRead interface_common.conf set foldmethod=marker
autocmd BufRead interface_common.conf set foldmarker={,}

autocmd BufRead collector_chargebands.conf set foldmethod=marker
autocmd BufRead collector_chargebands.conf set foldmarker={,}

autocmd BufRead interface_archive.conf set foldmethod=marker
autocmd BufRead interface_archive.conf set foldmarker={,}

" Asterisk Syntax Highlighting
au BufNewFile,BufRead voicemail.conf   setf asterisk_voicemail
au BufNewFile,BufRead extensions.conf  setf asterisk 
au BufNewFile,BufRead agents.conf      setf asterisk
au BufNewFile,BufRead asterisk.conf    setf asterisk
au BufNewFile,BufRead cdr_mysql.conf   setf asterisk
au BufNewFile,BufRead extensions.conf  setf asterisk
au BufNewFile,BufRead features.conf    setf asterisk
au BufNewFile,BufRead festival.conf    setf asterisk
au BufNewFile,BufRead logger.conf      setf asterisk
au BufNewFile,BufRead manager.conf     setf asterisk
au BufNewFile,BufRead modules.conf     setf asterisk
au BufNewFile,BufRead musiconhold.conf setf asterisk
au BufNewFile,BufRead queues.conf      setf asterisk
au BufNewFile,BufRead rtp.conf         setf asterisk
au BufNewFile,BufRead sip.conf         setf asterisk
au BufNewFile,BufRead zapata.conf      setf asterisk
au BufNewFile,BufRead zaptel.conf      setf asterisk

" Wiki Syntax Highlighting
" au BufRead,BufNewFile *.wiki setf wikipedia

" Load tags file for C
set tags+=~/.vim/systags
filetype plugin indent on
