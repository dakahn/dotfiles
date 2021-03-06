" =============================================================================
" plugins and modules
" =============================================================================
call plug#begin('~/.local/share/nvim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'itchyny/vim-gitbranch' 
Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak' 
Plug 'prettier/vim-prettier' 
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'vim-test/vim-test'
Plug 'simrat39/symbols-outline.nvim'
Plug 'sainnhe/everforest'
" Plug 'sainnhe/sonokai' 
" Plug 'chriskempson/base16-vim' 
" Plug 'jxnblk/vim-mdx-js'
" Plug 'pangloss/vim-javascript'
" Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

lua require('init')
source ~/.config/nvim/statusline.vim

" =============================================================================
" configs
" =============================================================================
inoremap jk <Esc>
nmap <C-g> :G diff<cr>
nnoremap <C-s> :Sex<cr>
nnoremap <C-e> :TroubleToggle<cr>
let mapleader = " "
let g:prettier#autoformat_config_present = 1
let g:markdown_fenced_languages = ['html', 'javascript', 'rust']
let g:deoplete#enable_at_startup = 1
let test#strategy = "neovim"
" ===== Folds ================================================================
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <Tab> za
set foldmethod=indent
set foldlevel=20
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif
" ===== FZF.vim ==============================================================
nnoremap <C-p> :GFiles<cr>
nnoremap <C-f> :Rg<cr>
nnoremap <C-b> :Buffers<cr>
let g:fzf_preview_window = []
let g:fzf_colors =                                                                         
    \ { 'fg':      ['fg', 'Normal'],                                                           
      \ 'bg':      ['bg', 'Normal'],                                                           
      \ 'hl':      ['fg', 'Comment'],                                                          
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],                             
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],                                       
      \ 'hl+':     ['fg', 'Statement'],                                                        
      \ 'info':    ['fg', 'PreProc'],                                                          
      \ 'border':  ['fg', 'Ignore'],                                                           
      \ 'prompt':  ['fg', 'Conditional'],                                                      
      \ 'pointer': ['fg', 'Exception'],                                                        
      \ 'marker':  ['fg', 'Keyword'],                                                          
      \ 'spinner': ['fg', 'Label'],                                                            
      \ 'header':  ['fg', 'Comment'] }
" ===== split nav ============================================================
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" =============================================================================
" Misc. sets
" =============================================================================
if exists('+termguicolors')
  set termguicolors
endif
colorscheme everforest
set colorcolumn=80
set completeopt=longest,menuone
set noshowmode
set noshowcmd
set nu
set hidden
set noerrorbells
set signcolumn=number
set clipboard=unnamedplus
set encoding=UTF-8
set scrolloff=8
set splitbelow
set splitright
set ignorecase
set smartcase
set title
set ruler
set number
set so=7
filetype plugin on
set wildmode=list:longest
set wildmenu
set expandtab
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set termguicolors
set noswapfile
set nobackup
set nowb
set cursorline
set shortmess+=c
set updatetime=100

