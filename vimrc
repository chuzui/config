set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" " alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/some/path/here')

" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-surround'
Plugin 'davidhalter/jedi-vim'
Plugin 'lifepillar/vim-mucomplete'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdcommenter'

Plugin 'easymotion/vim-easymotion'
" " Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)


" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


:set shiftwidth=4 softtabstop=4 expandtab
:set nu
set wildmode=longest,list
:set hlsearch
:set incsearch
set encoding=utf-8


nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

filetype plugin on

set completeopt+=menuone
inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
set completeopt+=noinsert
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

" Code Formatter using google/yapf
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

set splitbelow

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
map <F2> :NERDTreeSteppedOpen<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set term=screen-256color
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

