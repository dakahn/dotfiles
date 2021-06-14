" =============================================================================
" plugins
" =============================================================================
call plug#begin('~/.local/share/nvim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'airblade/vim-gitgutter' 
Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'justinmk/vim-sneak' 
Plug 'jxnblk/vim-mdx-js'
Plug 'sainnhe/sonokai'
Plug 'prettier/vim-prettier' 
Plug 'vim-airline/vim-airline'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

" =============================================================================
" configs
" =============================================================================
let g:mkdp_auto_start = 1
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

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  --LSP commands
  buf_set_keymap('n', '<space>d', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<space>h', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>t', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>i', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>R', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
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
