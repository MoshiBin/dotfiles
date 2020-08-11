" vim600: set foldmethod=marker
"
" Moshi's vimrc

" Section: General Settings "{{{
set nocompatible " VIM, not vi
set showcmd " Show partial command in the status line
set autowrite " write modified file on various occassions
set hidden " Buffers enter hidden mode when moving between buffers
set foldmethod=marker " Fold using three {'s
syntax on
filetype plugin indent on

let mapleader = ','

set rtp^=/home/moshib/.vim

" Have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") 
  \| exe "normal g'\"" | endif
endif

" }}}

" Section: Visual Settings "{{{
set cpoptions+=$ " Show a '$' at the end of changing text
set laststatus=2 " Always show status line
set showmatch " Show matching bracket
set tabstop=4 " Size of tabs
set expandtab " 4 spaces instead of tab character
set smarttab " 4 spaces work just like tab
set bg=dark " I like it dark
set wildmode=longest,list " When doing <TAB> show the list of options
set shortmess=aI " abbreviate all messages, and skip intro message
set t_Co=256 " 256 color mode
set number
" }}}

" Section: Search Settings "{{{
set incsearch " Show results while searching
set nohlsearch " Don't highlight matches
nnoremap <F1> :set hls!<cr>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.rpm
" }}}

" Section: Format Settings "{{{
set formatoptions=cql " Options for the text format command ('gq')
set shiftwidth=4 " how many spaces to autoindent
au FileType make set noexpandtab
au FileType html set shiftwidth=2 tabstop=2
au FileType css set shiftwidth=2 tabstop=2
au FileType python set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
au FileType yaml set tabstop=2 shiftwidth=2 softtabstop=2
au FileType yml set tabstop=2 shiftwidth=2 softtabstop=2
set textwidth=0
filetype indent on
" }}}

" Section: Plugins "{{{
let g:inkpot_black_background = 1
let g:python_highlight_all = 1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_python_flake8_args = "--ignore=E501"

let g:syntastic_sh_checkers = ["shellcheck"]
let g:syntastic_sh_shellcheck_args = "-e SC1117,SC1090 -s bash -x"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_c_include_dirs = ["/usr/include", "/usr/src/kernels/4.4.14-200.fc22.x86_64/include"]
let g:syntastic_c_remove_include_errors = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cache_dir = $HOME . "/.cache/ctrlp"
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:go_version_warning = 0

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-syntastic/syntastic'
Plug 'pearofducks/ansible-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'will133/vim-dirdiff'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'tfnico/vim-gradle'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'amadeus/vim-mjml'

call plug#end()

colorscheme gruvbox

" }}}

" Section: Bindings "{{{
noremap <Leader>a :TagbarToggle<CR>
"Toggle between windows
noremap <Leader>l :wincmd w<CR>
noremap <F6> :SyntasticCheck<CR>

" Close Location list (for syntastic check)
noremap <Leader>c :lclose<CR>

" Move between buffers using ctrl-arrows.
noremap <silent> [C :bn<CR>
noremap <silent> [D :bp<CR>

" Nertree
noremap <silent> <Leader>f :NERDTreeToggle<CR>

" Save files as root when I forget to use sudo with vim
cmap WW w !sudo tee > /dev/null %
cmap w!! w !sudo tee > /dev/null %
" }}}

