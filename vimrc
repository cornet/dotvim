" These must come before vundle
set nocp
filetype off
"
" Plugin Management
"
call plug#begin('~/.vim/plugged')
 
" Interface Plugins
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'

" Vimwiki!
Plug 'vimwiki/vimwiki'

" Git integration
Plug 'tpope/vim-fugitive'

" General code editing plugins
Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Ruby/Puppet Plugins
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'cornet/vim-puppet'

" Colourschems
Plug 'tomasr/molokai'

call plug#end()

"
" Main Configuration
"
filetype plugin indent on
syntax enable

" Use , rather than \ for mapleader
let mapleader = ","
let g:mapleader = ","

" Quick editing/reload of ~/.vimrc
map <leader>s :source ~/.vimrc<cr>
map <leader>e :e! ~/.vim/vimrc<cr>
autocmd! bufwritepost vimrc source ~/.vimrc

" Stop leaving .swp files all over the place
set directory=~/.vimtmp
set backupdir=~/.vimtmp

" Move between windows easily
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab configuration
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

set wildmenu
set ruler
set noerrorbells
set novisualbell
set t_vb=
set tags+=~/.vim/systags

"Set font to Monaco 10pt
if has("gui_running")
  colorscheme molokai
	set gfn=Monospace\ 10
	set guioptions=aAcem
  " To stop me accidently closing gvim
	cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'close' : 'q')<CR>
  " mousehide is broken - don't use it
  set nomousehide
else
	set t_Co=256
  colorscheme molokai
endif


" Quick toggle of line numbers
map <leader>l :set nu!<cr>

" Make backspace behave properly
set backspace=eol,start,indent

" Tabwidth options
set shiftwidth=2
set tabstop=2
set softtabstop=2

au FileType ruby  setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au FileType perl  setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

"
" Plugin Configuration
"
" Change dir whenever root changes
let NERDTreeChDirMode=2
map <leader>ne :NERDTree<cr>

" Set path to wiki
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]

" Use ag for file searching
let g:ctrlp_extensions =  ['buffertag', 'tag']
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
			\ --ignore .git
			\ --ignore .svn
			\ --ignore .hg
			\ --ignore .DS_Store
			\ --ignore "**/*.pyc"
			\ -g ""'


" Always display airline with dark theme
set laststatus=2
let g:airline_theme = 'dark'

" Clear out default symbols and load new ones
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Required for textobj-rubyblock
runtime macros/matchit.vim

" Use tab/shift-tab to navigate between tabstops
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" fugitive bindings
map <leader>gd :Gvdiff<cr>
map <leader>gs :Gstatus<cr>
map <leader>gl :Glog<cr>

map <leader>ga :Git add %:p<cr><cr>
map <leader>gt :Gcommit -v -q<cr>
map <leader>gc :Gcommit -v -q %:p<cr>
