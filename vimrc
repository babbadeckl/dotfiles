" Don't try to be vi compatible
set nocompatible

" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')

"Multi Cursor (https://github.com/terryma/vim-multiple-cursors)
Plug 'terryma/vim-multiple-cursors'

"Config statusline/tabline (https://github.com/itchyny/lightline.vim)
Plug 'itchyny/lightline.vim'

"File system explorer (https://github.com/preservim/nerdtree)
Plug 'preservim/nerdtree'

"Git markers within file
Plug 'vim-scripts/vim-gitgutter'

Plug 'morhetz/gruvbox'

Plug 'ajh17/VimCompletesMe'

Plug 'git@github.com:mileszs/ack.vim'

Plug 'git@github.com:kien/ctrlp.vim'

call plug#end()

map <C-o> :NERDTreeToggle<CR>

" gruvbox color config
colorscheme gruvbox
set background=dark

" ack config
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_working_path_mode = 'ra'
endif

" YCM
nnoremap <silent><leader>gd :YcmCompleter GoTo <CR>
nnoremap <silent><leader>gf :YcmCompleter FixIt

" Helps force plugins to load correctly when it is turned back on below
filetype off

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
let mapleader = ","

" Security
set modelines=0

" Show line numbers
set rnu 
set nu

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=80
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
map <Leader> <Space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>
" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL
