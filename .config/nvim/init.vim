" =============================================================================
" plugins
" =============================================================================
call plug#begin('~/.local/share/nvim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'airblade/vim-gitgutter' 
Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'mbbill/undotree'
Plug 'justinmk/vim-sneak' 
Plug 'prettier/vim-prettier', { 'do': 'yarn install'} 
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jxnblk/vim-mdx-js'
Plug 'sainnhe/sonokai'
Plug 'vim-airline/vim-airline'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

" =============================================================================
" configs
" =============================================================================
let g:mkdp_auto_start = 1
let g:deoplete#enable_at_startup = 1
" don't run Deoplete in Telescope buffers
autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)
let g:sneak#s_next = 1
let mapleader = " "
let g:prettier#autoformat_config_present = 1
let g:airline_powerline_fonts = 1
inoremap jk <Esc>
nnoremap <C-h> :UndotreeToggle<cr>
nnoremap <C-s> :Sex<cr>
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>
nmap <C-g> :G<cr>
" ===== split navigation ==============
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" ===== Tree-Sitter ==============
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.javascript.used_by = "javascript.jsx"
parser_config.typescript.used_by = "javascript.jsx"
EOF

" =============================================================================
" sets
" =============================================================================
colorscheme sonokai 
if exists('+termguicolors')
  set termguicolors
endif
set noshowmode
set noshowcmd
set nu
set hidden
set noerrorbells
set signcolumn=yes
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
set shortmess+=F
set updatetime=100

