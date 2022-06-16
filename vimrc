filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
"Plugin 'morhetz/gruvbox'
"Plugin 'arzg/vim-colors-xcode'
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'mbbill/undotree'
Plugin 'rking/ag.vim'
Plugin 'sainnhe/edge'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'pboettch/vim-cmake-syntax'
"Plugin 'peterhoeg/vim-qml'
Plugin 'fedorenchik/qt-support.vim'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on   " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" See github page for more info.

" Syntax color scheme
set background=dark
colorscheme edge 

" change the leader key 
let mapleader=","

" NERDTree file explorer
nnoremap <C-N> :NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
" exit NERDTree if it's the last window open
autocmd BufEnter * if tabpagenr('$') == 1 &&  winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" prevent other buffers from replacing the NERDTree window
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \   let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" NERDTree icon and text highlighting
let g:NERDTreeFileExtensionHighlightFullName=1

" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>

" the silver searcher
nnoremap <leader>a :Ag

" set easier CtrlP mapping for directory search
nnoremap <leader>p :CtrlP 
" set CtrlP to use Ag and disable cache (Ag is fast enough) 
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
let g:ctrlP_use_caching=0
" remap the CtrlP buffer cmd
nnoremap <leader>b :CtrlPBuffer<CR>

" Basic Settings "
syntax on
set mouse=a " set the mouse on for easy window sizing
set encoding=UTF-8 " necessary for proper terminal font formatting
set noswapfile " disable the swap file
set number " line numbers to the left-hand side
set shiftwidth=4 " set the shift wide to 4 spaces
set tabstop=4 " set the tab width to 4 columns
set expandtab " use space characters instead of tabs
set nobackup " do not save backup files
set cursorline " highlight the cursor line
set scrolloff=5 " do not let the cursor scroll below or above N number of lines when scrolling
set ignorecase " ignore case when searching
set incsearch " search as characters are entered
set showcmd " show partial command as you type on the last line of the screen
set showmode " show the mode you are on on the last line
set showmatch " show matching words during a search
"set hlsearch " use highlighting when doing a search
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to
set autochdir " automatically change to current buffer/file dir

" allow bash aliases in ! commands
let $BASH_ENV="~/.bash_aliases"

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
noremap B ^
noremap E $

" set $ and ^ to do nothing
nnoremap $ <nop>
nnoremap ^ <nop>

" remap the <ESC> key to leave insert mode
inoremap jk <ESC>

" save session shortcut. reopen the session with vim -S.
let g:sessions_dir='~/.vim/sessions/'
exec 'nnoremap <leader>ss :mksession! ' . g:sessions_dir . '*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <leader>sr :source ' . g:sessions_dir . '*.vim<C-D><BS><BS><BS><BS><BS>'

