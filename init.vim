" These must come before vundle
set nocp
filetype off
"
" Plugin Management
"
call plug#begin('~/.config/nvim/plugged')
" 
" Interface Plugins
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'

" Vimwiki!
Plug 'vimwiki/vimwiki'

" Git integration
Plug 'tpope/vim-fugitive'

" General code editing plugins
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'xolox/vim-misc'
Plug 'majutsushi/tagbar'
Plug 'benekastah/neomake'

" Ruby/Puppet Plugins
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'cornet/vim-puppet'

" Syntax highlighting
Plug 'wellbredgrapefruit/tomdoc.vim'

" Colourschems
Plug 'tomasr/molokai'
" Plug 'NLKNguyen/papercolor-theme'

call plug#end()

"
" Main Configuration
"
filetype plugin indent on
syntax enable

" Revert annoying nvim defaults
set noincsearch
set mouse=

" Use , rather than \ for mapleader
let mapleader = ","
let g:mapleader = ","

" Quick editing/reload of ~/.vimrc
map <leader>s :source ~/.config/nvim/init.vim<cr>
map <leader>e :e! ~/.config/nvim/init.vim<cr>
autocmd! bufwritepost nvimrc source ~/.config/nvim/init.vim

" Auto-run Neomake on save
autocmd! bufwritepost * Neomake

" Stop leaving .swp files all over the place
set directory=~/.vimtmp
set backupdir=~/.vimtmp

" Move between windows easily
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use ctrl+n to enter terminal visual mode
tnoremap <C-n> <C-\><C-n>

" Fzf mapping
map <leader>ft :FzfBTags<cr>
map <leader>fb :FzfBuffers<cr>
map <leader>fc :FzfCommits<cr>
map <leader>fs :FzfSnippets<cr>
map <leader>fg :FzfGitFiles<cr>
map <leader>ff :FZF<cr>

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
  " colorscheme PaperColor-Dark
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
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
			\ --ignore .git
			\ --ignore .svn
			\ --ignore .hg
			\ --ignore .DS_Store
			\ --ignore "**/*.pyc"
			\ -g ""'


" Always display airline with dark theme
set laststatus=2

let g:airline_theme='dark'

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
map <leader>gb :Gbrowse<cr>

map <leader>ga :Git add %:p<cr><cr>
map <leader>gt :Gcommit -v -q<cr>
map <leader>gc :Gcommit -v -q %:p<cr>

" Support puppet ctags
map <leader>t :TagbarToggle<cr>
let g:easytags_dynamic_files = 1
let g:easytags_events = ['BufWritePost']
let g:tagbar_type_puppet = {
    \ 'ctagstype': 'puppet',
    \ 'kinds': [
        \'c:class',
        \'s:site',
        \'n:node',
        \'d:definition'
      \]
    \}

" Fix neomake puppet parser maker
let g:neomake_puppet_puppet_maker = {
			\ 'exe': 'puppet',
			\ 'args': ['parser', 'validate', '--color=false'],
			\ 'errorformat': '%t%*[a-zA-Z]: %m at %f:%l',
			\ }

" Disable puppet-lint checker
let g:neomake_puppet_puppetlint_maker = {
			\ }

let g:neomake_puppet_enable_makers = ['puppet']

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

let g:fzf_command_prefix = 'Fzf'
map <C-p> :FzfGitFiles<cr>
