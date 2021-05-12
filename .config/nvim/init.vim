" =============================================================================
" plugins
" =============================================================================
call plug#begin('~/.local/share/nvim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'airblade/vim-gitgutter' 
Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'mbbill/undotree'
Plug 'justinmk/vim-sneak' 
Plug 'prettier/vim-prettier', { 'do': 'yarn install'} 
Plug 'jxnblk/vim-mdx-js'
Plug 'sainnhe/sonokai'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" =============================================================================
" configs
" =============================================================================
let g:deoplete#enable_at_startup = 1
let g:sneak#s_next = 1
let mapleader = " "
:inoremap jk <Esc>
nnoremap <C-h> :UndotreeToggle<CR>
nnoremap <C-s> :Sex<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <C-b> :Buf<CR>
nnoremap <C-g> :Commits<CR>
" ===== split navigation ==============
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" =============================================================================
" sets
" =============================================================================
colorscheme sonokai 
if exists('+termguicolors')
  set termguicolors
endif
set relativenumber
set nu
set nowrap
set hidden
set noerrorbells
set colorcolumn=80
set signcolumn=yes
set clipboard=unnamedplus
set encoding=UTF-8
set scrolloff=8
" set splitbelow
" set splitright
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

" =============================================================================
" lsp config
" =============================================================================
lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.rust_analyzer.setup{
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importMergeBehavior = "last",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
    },
  },
}
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

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

local servers = { "pyright", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

