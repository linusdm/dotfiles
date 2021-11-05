call plug#begin()
    Plug 'preservim/nerdtree'
    " elixir syntax highlighting
    Plug 'elixir-editors/vim-elixir'
    " color scheme
    Plug 'ayu-theme/ayu-vim'
    " dev icons
    Plug 'kyazdani42/nvim-web-devicons'
    " elixir LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    Plug 'nvim-treesitter/nvim-treesitter', {'branch': '0.5-compat', 'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'

    Plug 'vim-test/vim-test'
    Plug 'voldikss/vim-floaterm'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'

    Plug 'mhinz/vim-mix-format'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

set hidden
set encoding=utf8
syntax on

set smartindent
set shiftwidth=2 " number of spaces when shift indenting
set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tab to spaces

set number relativenumber " show line numbers
set cursorline " highlight current line
set nowrap
set path+=**

set termguicolors " enable true colors support
let ayucolor="mirage"
colorscheme ayu

set showtabline=2 " always show tabs
set laststatus=2 " always show a status line

set foldmethod=syntax "syntax highlighting items specify folds  
set foldcolumn=1 "defines 1 col at window left, to indicate folding  
let javaScript_fold=1 "activate folding by JS syntax  
let php_folding = 1
set foldlevelstart=99 "start file with all folds opened

let test#strategy = "floaterm"
let g:floaterm_keymap_toggle = '<F6>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

nnoremap <F5> :NERDTreeToggle<cr>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <leader>tn <cmd>TestNearest<cr>
nnoremap <leader>tf <cmd>TestFile<cr>
nnoremap <leader>tl <cmd>TestLast<cr>
nnoremap <leader>tv <cmd>TestVisit<cr>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>p <cmd>MixFormat<cr>
let g:mix_format_on_save = 1

lua require("lsp")
