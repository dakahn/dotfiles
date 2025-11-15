" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
call plug#end()


if (has('termguicolors'))
  set termguicolors
endif

syntax on
colorscheme wildcharm   


let g:currentmode={
	\ 'n' : 'NORMAL ',
	\ 'v' : 'VISUAL ',
	\ 'V' : 'V-LINE ',
	\ "\<C-V>" : 'V-BLOCK' ,
	\ 'i' : 'INSERT ',
	\ 'R' : 'R ',
	\ 'Rv' : 'V-REPLACE ',
	\ 'c' : 'COMMAND ',
\}

set statusline+=\ %#NormalC#%{(mode()=='n')?'\ NORMAL\ ':''}
set statusline+=%#InsertC#%{(mode()=='i')?'\ INSERT\ ':''}
set statusline+=%#VisualC#%{(mode()=='v')?'\ VISUAL\ ':''}
set statusline+=%#Filename#
set statusline+=\ %f
set statusline+=%#ReadOnly#
set statusline+=\ %r
set statusline+=%m
set statusline+=%=
set statusline+=%#Fileformat#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}\]
set statusline+=%#Position#
set statusline+=\ [%l/%L]

set updatetime=100
set signcolumn=yes
set noshowmode
set laststatus=2
set hidden
set clipboard=unnamed,unnamedplus
set showcmd
set copyindent
set preserveindent
set noswapfile
set splitbelow
set splitright
set number
set ruler
set linebreak
set wildmenu
set wildoptions=pum
set wildmode=longest:full,full
set textwidth=80
set autoindent
set autoread
set ignorecase
set incsearch
set smartcase
set hlsearch
set backspace=indent,eol,start
set complete-=i
set smarttab


inoremap jk <Esc>
nnoremap <Esc> :noh<cr>
nnoremap n nzzzv 
" keep cursor in the middle
nnoremap N Nzzzv
nnoremap J mzJ`z
" split nav 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Fzf
nnoremap <C-p> :Files<cr>
nnoremap <C-f> :Rg<cr>
nnoremap <C-b> :Buffers<cr>
" Autopairs
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

