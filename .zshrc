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
bindkey "\e$terminfo[kcub1]" backward-word
bindkey "\e$terminfo[kcuf1]" forward-word

# Aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias ..="cd .."

alias cp="cp -i"
alias rm="rm -i"
alias mv='mv -i'

alias config='/usr/bin/git --git-dir=/home/alex/dotfiles/ --work-tree=/home/alex'
alias "xshoursay"="xcowsay --image=/usr/share/xcowsay/shour.png --bubble-at=-75,-65"

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

# Exports
export EDITOR=vim
export VISUAL=vim

# Path modifications
export PATH=$PATH:/home/alex/Documents/scripts

# On term Start
clear
pfetch

# For Z
[[ -r /usr/share/z/z.sh ]] && source /usr/share/z/z.sh
