if (has('termguicolors'))
  set termguicolors
endif

syntax on
colorscheme wildcharm   

set hidden "
set clipboard=unnamed,unnamedplus
set showcmd
set copyindent
set preserveindent
set noswapfile
set laststatus=2
set splitbelow
set splitright
set number
set ruler
set linebreak
set wildmenu
set wildoptions=pum
set wildmode=longest:list,full
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
" ===== keep cursor in the middle ======
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" ===== split nav ======================
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

