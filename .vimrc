set nocompatible              " be iMproveasdf, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'stephpy/vim-yaml'
Plugin 'dracula/vim', { 'name': 'dracula' }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Put your non-Plugin stuff after this line
" autoload .vimrc
" autocmd BufWritePost .vimrc source $MYVIMRC

syntax on
colorscheme dracula
let g:airline_theme='papercolor'

" set leader
let mapleader = ","

" time out leader faster
set timeoutlen=1000

" read a changed file automatically
set autoread

" hide buffer when leaving window, instead of abandoning it
set hidden

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" no backups
set nobackup
set noswapfile
set nowb

" set visual bell so ESC in normal mode doesn't beep
set visualbell
set noerrorbells

" format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
"set cmdheight=2

" no help
nmap <F1> <Esc>

set autoindent    " turn on autoindent
set history=100   " keep 100 lines of history
set hlsearch      " highlight search terms
set ignorecase    " ignore case, but use smartcase
set incsearch     " enable incremental search
set laststatus=2  " always display the status line
" set list          " show end of line
set nowrap        " turn off wrap
set number        " turn on line numbers
set numberwidth=4 " set number width
set ruler         " show the cursor all the time
set scrolloff=10  " leave space at top and bottom
set showcmd       " display incomplete commands
set showmatch     " show matching braces, etc
set smartcase

nnoremap <CR> :noh<CR><CR>

" better split positioning
set splitbelow
set splitright

" navigate splits easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" rspec
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"

" set file types
autocmd BufNewFile,BufRead *.haml setfiletype haml
autocmd BufNewFile,BufRead *.txt setfiletype text
autocmd BufNewFile,BufRead *.raml,*.yaml,*.yml setfiletype yaml
"autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist

" run goimports when saving (which is gofmt + imports)
let g:go_fmt_command = "goimports"

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

