" Setting a Few words
set number
set relativenumber
set expandtab
set tabstop=4
set ignorecase

" Setting syntax highlighting
syntax on


" Update sxhkd when saving the config file
    autocmd BufWritePost *sxhkdrc !killall sxhkd; cd ~; setsid sxhkd &
