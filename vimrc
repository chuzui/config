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

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdcommenter'

Plugin 'easymotion/vim-easymotion'
Plugin 'vim-syntastic/syntastic'
Plugin 'raimondi/delimitmate'

Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'tpope/vim-fugitive'

Plugin 'fatih/vim-go'
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

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2


nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

filetype plugin on

" Code Formatter using google/yapf
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

set splitbelow

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:nerdtree_tabs_open_on_console_startup=2
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

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:jedi#completions_enabled = 0

imap <C-c> <CR><Esc>O


map <F5> :call CompileAndRun() <CR>
func! CompileAndRun()
    exec "w"
    if &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'javascript'
        exec "!node %"
    endif
endfunc

" enable jsx syntax in js file
let g:jsx_ext_required = 0

" enable tab to expand emmet
imap <expr> <C-t> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
            \  'javascript.jsx' : {
            \      'extends' : 'jsx',
            \  },
            \}
