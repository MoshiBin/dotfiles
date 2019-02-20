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
colorscheme inkpot2 " We have 256 colors, use them!
" }}}

" Section: Search Settings "{{{
set incsearch " Show results while searching
set nohlsearch " Don't highlight matches
nnoremap <F1> :set hls!<cr>
" }}}

" Section: Format Settings "{{{
set formatoptions=cql " Options for the text format command ('gq')
set shiftwidth=4 " how many spaces to autoindent
au FileType make setlocal noexpandtab
au FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
au FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
set textwidth=0
filetype indent on
" }}}

" Section: Plugins "{{{
let g:inkpot_black_background = 1
let g:python_highlight_all = 1

let g:airline_powerline_fonts = 1

execute pathogen#infect()
" }}}

" Section: Bindings "{{{
noremap <Leader>a :TagbarToggle<CR>
"Toggle between windows
noremap <Leader>l :wincmd w<CR>
" }}}
