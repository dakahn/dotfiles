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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jxnblk/vim-mdx-js'
Plug 'sainnhe/sonokai'
Plug 'vim-airline/vim-airline'
call plug#end()

" =============================================================================
" configs
" =============================================================================
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
