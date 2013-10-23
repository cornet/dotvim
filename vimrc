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
set gfn=Ubuntu\ Mono\ 11

" Theme selection
if has("gui_running")
  colorscheme molokai
	set guioptions=aAcem
  " To stop me accidently closing gvim
	cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'close' : 'q')<CR>
  " mousehide is broken - don't use it
  set nomousehide
else
	set t_Co=256
  colorscheme molokai
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
" set showmatch

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
set shiftwidth=2
set tabstop=2
set softtabstop=2

au FileType ruby  setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au FileType perl  setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab


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
	let NERDTreeChDirMode=2
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

	""""""""""""""""""""""""""""""""
	" For CtrlP
	""""""""""""""""""""""""""""""""
	let g:ctrlp_extensions =  ['buffertag', 'tag']

	""""""""""""""""""""""""""""""""
	" For PowerLine
	""""""""""""""""""""""""""""""""
	" let g:Powerline_symbols = 'fancy'
	set laststatus=2

	
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Specific Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Arduino files
autocmd BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd BufNewFile,BufRead *.pde set cindent
autocmd BufNewFile,BufRead *.ino set cindent
" Puppet files
autocmd BufNewFile,BufRead *.pp set iskeyword=-,:,@,48-57,_,192-255

" Load tags file for C
set tags+=~/.vim/systags
filetype plugin indent on

augroup Powerline
	au!
	au BufRead * call Pl#Load()
augroup END
