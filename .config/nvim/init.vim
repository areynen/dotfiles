set number
set cursorline
set relativenumber
set expandtab
set tabstop=4
set ignorecase
set smartcase
set clipboard+=unnamedplus

set wildmode=longest,list,full


" Setting syntax highlighting
syntax on

call plug#begin()

" Declare the list of plugins.
Plug 'preservim/nerdcommenter'
Plug 'neovim/nvim-lspconfig'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'dense-analysis/ale'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'matze/vim-move'
Plug 'AckslD/vim-capword'
Plug 'ellisonleao/gruvbox.nvim'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Puglin Specific Config

let g:move_map_keys = 0

vmap <C-S-Down> <Plug>MoveBlockDown
vmap <C-S-Up> <Plug>MoveBlockUp
nmap <C-S-Down> <Plug>MoveLineDown
nmap <C-S-Up> <Plug>MoveLineUp

" NerdCommenter key mappings
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle


" Update sxhkd when saving the config file
autocmd BufWritePost *sxhkdrc !killall sxhkd | cd ~ | setsid sxhkd &

"colorscheme vim
"set background=dark " or light if you want light mode
colorscheme gruvbox

