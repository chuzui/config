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
Plugin 'SirVer/ultisnips'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'timburgess/extempore.vim'

Plugin 'rust-lang/rust.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

Plugin 'JamshedVesuna/vim-markdown-preview'
" " Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)


" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


set shiftwidth=4 softtabstop=4 expandtab
set tabstop=4
set nu
set hlsearch
set incsearch
set encoding=utf-8
set splitbelow

set wildmode=longest,list
set ignorecase smartcase

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" golang config
autocmd FileType go nnoremap <Leader>g :YcmCompleter GoTo<CR>


nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

filetype plugin on

" Code Formatter using google/yapf
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

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

set autowrite
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_list_type = "quickfix"
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
let g:go_auto_type_info = 1
set updatetime=100

function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

let g:syntastic_python_flake8_args = "--ignore=E501"

let g:go_metalinter_enabled = ['gofmt', 'goimports', 'vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_gocode_propose_source = 1
let g:go_fmt_command = "goimports"

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly-2018-12-06', 'rls']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'Cargo.toml'))},
        \ 'whitelist': ['rust'],
        \ })
endif
let g:rustfmt_autosave = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

let g:ycm_filetype_blacklist = {
      \ 'rust': 1,
      \}
autocmd FileType rust nmap <leader>r  :RustRun<CR>

command Tq execute "tabclose"

let vim_markdown_preview_toggle=2
let vim_markdown_preview_github=0
