call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'ayu-theme/ayu-vim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-lua/plenary.nvim'

    Plug 'elixir-editors/vim-elixir' " elixir syntax highlighting

    Plug 'neovim/nvim-lspconfig'

    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    Plug 'nvim-treesitter/nvim-treesitter', {'branch': '0.5-compat', 'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'

    Plug 'vim-test/vim-test'
    Plug 'airblade/vim-gitgutter'
    " Plug 'tpope/vim-surround'
    " Plug 'tpope/vim-fugitive'

    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'maxmellon/vim-jsx-pretty'

    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
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
set foldlevelstart=99 "start file with all folds opened

let test#strategy = "neovim"

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

lua require("lsp")
