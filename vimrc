let mapleader=','

set nocompatible
filetype off

" Plug {{{
call plug#begin()

" let Plug manage Vundle, required

" NERDTree
Plug 'scrooloose/nerdtree'

" Fugitive git wrapper
Plug 'tpope/vim-fugitive'

" Syntastic syntax checker
Plug 'scrooloose/syntastic'

" Parenthesis
Plug 'junegunn/rainbow_parentheses.vim'

" CTRL P fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" YouCompleteMe
" Needs ncurses 5 compat libs
" cmake
" clang
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --js-completer --java-completer' }

" Tagbar
Plug 'majutsushi/tagbar'

" NERD Commenter
Plug 'scrooloose/nerdcommenter'

" VIM Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" VIM Dev-icons (nerd ICONS)
Plug 'ryanoasis/vim-devicons'

" Colorschemes
" Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'

" Supertab
Plug 'ervandew/supertab'

" Easymotion
Plug 'easymotion/vim-easymotion'

" Tabular
Plug 'godlygeek/tabular'

" CPP highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" Minu buffer menu
Plug 'fholgado/minibufexpl.vim'

Plug 'morhetz/gruvbox'

Plug 'PotatoesMaster/i3-vim-syntax'

Plug 'davidhalter/jedi-vim'

Plug 'mattn/emmet-vim'

call plug#end()
" }}}
filetype plugin indent on
" Mappings {{{
nnoremap <CR> :nohlsearch<CR><CR>

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

nnoremap <F2> :buffers<CR>:buffer<Space>

map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <F9>:make clean<CR> :make %<<CR> :!./%<

nnoremap <leader>b :MBEFocus<CR>
" }}}
" TAB {{{
syntax enable
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"}}}
" Visual {{{
set relativenumber number
set showcmd
set cursorline
set laststatus=2
set listchars=tab:▶\ ,eol:★
set listchars+=trail:◥
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=space:.

"vertical splits less gap between bars
set fillchars+=vert:│
map <F5> :set list!<CR>
set encoding=utf8
set guifont=SauceCodePro\ Nerd\ Font\ Regular\ 10
" }}}
" General {{{
set wildmenu
set lazyredraw
set showmatch
set smartcase
set nocompatible
set backspace=indent,eol,start
set background=dark
"colorscheme gruvbox
"let g:gruvbox_contrast_dark = 'hard'
" pOssible is hard medium soft

"set t_Co=16
colorscheme solarized
let g:soalrized_termcolor=256
" }}}
" Completion {{{
set wildmode=longest:list,full
set wildmenu
" }}}
" Search {{{
set hlsearch
set incsearch
set smartcase
" }}}
" Folding {{{
set foldenable
nnoremap <space> za
" }}}
" Backup {{{
set backupdir=$HOME/.vim/.backup//
set directory=$HOME/.vim/.SWP//
" }}}
" Auto {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre */php.*/py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown

    autocmd Filetype java setlocal noexpandtab
    autocmd filetype java setlocal list
    " PHP {{{
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    " }}}
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    " SH {{{
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    " }}}
    " C/C++ {{{
    autocmd FileType *.c,*.cpp,*.h,*.hpp,*cxx,*.hxx setlocal tabstop=2
    autocmd FileType *.c,*.cpp,*.h,*.hpp,*cxx,*.hxx setlocal softtabstop=2
    autocmd FileType *.c,*.cpp,*.h,*.hpp,*cxx,*.hxx setlocal shiftwidth=2
    autocmd FileType *.c,*.cpp,*.h,*.hpp,*cxx,*.hxx set colorcolumn=110
    autocmd FileType *.c,*.h setlocal makeprg="make --makefile=/home/kabor/.vim/templates/Makefile "
    " }}}
  autocmd FileType lisp,clojure,scheme,java,*.c,*.cpp,*.h RainbowParentheses
augroup END
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" }}}
" NERD COmmenter {{{
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" }}}
" Statusline {{{
"hi User1 guifg=#eea040 guibg=#222222
"hi User2 guifg=#dd3333 guibg=#222222
"hi User3 guifg=#ff66ff guibg=#222222
"hi User4 guifg=#a0ee40 guibg=#222222
"hi User5 guifg=#eeee40 guibg=#222222

"set statusline=
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%F%*            "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor
" }}}
" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}
" CTRL P {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" }}}
" MarkDown {{{
let g:markdown_fenced_languages=['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal=1
let g:markdown_minlines=100
" }}}
" Airline {{{
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
" }}}
" YouCompleteMe {{{
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra.conf.py'
" }}}
" vim:foldmethod=marker:foldlevel=0
