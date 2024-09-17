" Setting a Few words
set number
set relativenumber
set expandtab
set tabstop=4
set ignorecase
set smartcase
set clipboard+=unnamedplus

set wildmode=longest,list,full

filetype plugin on

" Setting syntax highlighting
syntax on

call plug#begin()

" Declare the list of plugins.
Plug 'preservim/nerdcommenter'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Update sxhkd when saving the config file
    autocmd BufWritePost *sxhkdrc !killall sxhkd; cd ~; setsid sxhkd &
