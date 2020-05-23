# Path to your oh-my-zsh installation.
export ZSH="/home/alex/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(git
	zsh-syntax-highlighting
   	zsh-autosuggestions
	)

source $ZSH/oh-my-zsh.sh

eval $(thefuck --alias)

# Binding alt arrows to l/r word
# urxvt
bindkey "\e$terminfo[kcub1]" backward-word
bindkey "\e$terminfo[kcuf1]" forward-word
# ST
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

# Aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias ..="cd .."

alias cp="cp -i"
alias rm="rm -i"
alias mv='mv -i'

alias config='/usr/bin/git --git-dir=/home/alex/dotfiles/ --work-tree=/home/alex'
alias "xshoursay"="xcowsay --image=/usr/share/xcowsay/shour.png --bubble-at=-75,-65"

alias vi3=vim\ ~/.config/i3/config
alias vzsh=vim\ ~/.zshrc
alias vdwm=vim\ ~/Documents/dwm/config.h
alias vhk=vim\ ~/.config/sxhkd/sxhkdrc
alias vvim=vim\ ~/.vimrc

# Functions
# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
exprop()
{
xprop | awk '
    /^WM_CLASS/{sub(/.* =/, "instance:"); sub(/,/, "\nclass:"); print}
    /^WM_NAME/{sub(/.* =/, "title:"); print}'
}

# Exports
export EDITOR=vim
export VISUAL=vim
export TERMINAL=st
export FILE_BROWSER=thunar
export BROWSER=firefox
export _JAVA_AWT_WM_NONREPARENTING=1

# Path modifications
export PATH=$PATH:/home/alex/Documents/scripts

# On term Start
#clear
pfetch

# For Z
[[ -r /usr/share/z/z.sh ]] && source /usr/share/z/z.sh

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

