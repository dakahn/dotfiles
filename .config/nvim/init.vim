" =============================================================================
" plugins
" =============================================================================
call plug#begin('~/.local/share/nvim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-gitgutter' 
Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'mbbill/undotree'
Plug 'justinmk/vim-sneak' 
Plug 'nvim-lua/completion-nvim'
Plug 'jxnblk/vim-mdx-js'
Plug 'sainnhe/sonokai'
Plug 'prettier/vim-prettier' 
Plug 'vim-airline/vim-airline'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'neovim/nvim-lspconfig'
call plug#end()

" =============================================================================
" configs
" =============================================================================
let g:mkdp_auto_start = 0
let mapleader = " "
let g:prettier#autoformat_config_present = 1
let g:airline_powerline_fonts = 1
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap jk <Esc>
nnoremap <C-h> :UndotreeToggle<cr>
nnoremap <C-s> :Sex<cr>
nnoremap <C-p> :GFiles<cr>
nnoremap <C-f> :Rg<cr>
nnoremap <C-b> :Buffers<cr>
nmap <C-g> :G<cr>
nnoremap <Tab> za

" Neovim LSP Setup
lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})
EOF

" ===== split navigation ==============
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" =============================================================================
" sets
" =============================================================================
colorscheme sonokai 
if exists('+termguicolors')
  set termguicolors
endif
set completeopt=menuone,noinsert,noselect
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
set shortmess+=c
set updatetime=100
set foldmethod=indent
set foldlevel=20
