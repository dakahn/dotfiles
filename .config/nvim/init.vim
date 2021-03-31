" ==============================================
" plugins
" ==============================================
call plug#begin('~/.local/share/nvim/plugged')
Plug 'jiangmiao/auto-pairs' "create pairs of parenthesis, apostrophes, with cursor in the middle
Plug 'tpope/vim-commentary' " use gc to comment selection/gcc to comment out lines
Plug 'airblade/vim-gitgutter' "show git status in the margin of a file
Plug 'tpope/vim-fugitive' " use :Git to run git commands from vim instance
Plug 'scrooloose/nerdtree' " use <C-n> to show file explorer tree view
Plug 'Xuyuanp/nerdtree-git-plugin' " show git status for files in Nerdtree
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fast fuzzy finder
Plug 'junegunn/fzf.vim' " june's custom fzf bindings for vim 
Plug 'justinmk/vim-sneak' "s<char><char> then s or S to move about
Plug 'w0rp/ale' "vim asynchronous syntax checker
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } "opinionated autoformatter
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "autocomplete framework
Plug 'ryanoasis/vim-devicons' " pretty icons for various vim plugins
Plug 'itchyny/lightline.vim' " a status line
Plug 'tpope/vim-surround' " add tag to word csw{tag}, add tag to visual selection S{tag}, change tag cs{pre tag}{tag}    

" ====== syntax highlighting support ===========
Plug 'mustache/vim-mustache-handlebars'
Plug 'jxnblk/vim-mdx-js'
Plug 'niftylettuce/vim-jinja'
Plug 'GutenYe/json5.vim'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'cakebaker/scss-syntax.vim' 

" ====== colorscheme ===========================
Plug 'sainnhe/everforest'
call plug#end()

" ==============================================
" plugin config
" ==============================================
let g:ale_fixers = {
 \ 'javascript': ['eslint', 'prettier'],
 \ 'markdown' : ['prettier'],
 \ 'css': ['prettier'],
 \ 'html': ['prettier']
 \ }
let g:ale_fix_on_save = 1
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:sneak#s_next = 1
let g:lightline = {'colorscheme': 'everforest'}
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor,lib,es}/*"'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" ==============================================
" editor config
" ==============================================
let mapleader = "C"
:inoremap jk <Esc>
nnoremap <C-w> :bdelete!<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :Rg<CR> 
nnoremap <C-t> :Buffers<CR>

" ===== split navigation =======================
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

colorscheme everforest 
if exists('+termguicolors')
  set termguicolors
endif
set clipboard=unnamedplus
set encoding=UTF-8
set splitbelow
set splitright
set ignorecase
set smartcase
set hidden
set title
set scrolloff=1
set ruler
set number
set so=7
filetype plugin on
set wildmode=list:longest
set wildmenu
set expandtab
set tabstop=2
set shiftwidth=2
set termguicolors
set noswapfile
set nobackup
set noshowcmd
set noshowmode
set nowb
set cursorline
set shortmess+=F
set updatetime=100


