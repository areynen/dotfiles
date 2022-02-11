thefuck --alias | source 

alias vim=nvim

alias ls="ls --color=auto"
alias grep="grep --color=auto"

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
alias vdunst=vim\ ~/.config/dunst/dunstrc
alias vmpv=vim\ ~/.config/mpv/mpv.conf
alias vfish=vim\ ~/.config/fish/config.fish
alias vnvim=vim\ ~/.config/nvim/init.vim
alias vurls=vim\ ~/.config/newsboat/urls
alias vnews=vim\ ~/.config/newsboat/config
alias vxrdb=vim\ ~/.Xresources
alias vtc=vim\ ~/.local/bin/to_consume.txt
alias vtcl=vim\ ~/.local/bin/to_consume_long.txt
alias cq=code\ ~/.config/newsboat/RSSQueryMaker.txt
alias cqn=code\ ~/.config/newsboat/RSSQueryMakerNyaa.txt
alias mpv480="mpv --sid=no --ytdl-format='bestvideo[height<=480][fps<=?30]+bestaudio/best'"
alias mpv360="mpv --sid=no --ytdl-format='bestvideo[height<=360][fps<=?30]+bestaudio/best'"
alias cx=chmod\ +x
alias yay=paru

function ex
  set ext zip rar bz2 gz tar tbz2 tgz Z 7z xz exe tar.bz2 tar.gz tar.xz lzma cbz
  if test -z "$argv"
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz|lzma|cbz>"
  else
    if test -f "$argv"
      switch $argv
        case "*.$ext[1]"
          unzip ./$argv
        case "*.$ext[2]"
          unrar x -ad ./$argv
        case "*.$ext[5]"
          tar xvf ./$argv
        case "*.$ext[6]"
          tar xvjf ./$argv
        case "*.$ext[7]"
          tar xvzf ./$argv
        case "*.$ext[8]"
          uncompress ./$argv
        case "*.$ext[9]"
          7z x ./$argv
        case "*.$ext[11]"
          cabextract ./$argv
        case "*.$ext[12]"
          tar xvjf ./$argv
        case "*.$ext[3]"
          bunzip2 ./$argv
        case "*.$ext[13]"
          tar xvzf ./$argv
        case "*.$ext[4]"
          gunzip ./$argv
        case "*.$ext[14]"
          tar xvJf ./$argv
        case "*.$ext[10]"
          unxz ./$argv
        case "*.$ext[15]"
          unlzma ./$argv
        case "*.$ext[16]"
          7z x ./$argv
        case '*'
          echo "extract: $argv - unknown archive method"
      end
    else
      echo $argv "- file does not exist"
    end
  end
end

function exprop
  xprop | awk '
  /^WM_CLASS/{sub(/.* =/, "instance:"); sub(/,/, "\nclass:"); print}
  /^WM_NAME/{sub(/.* =/, "title:"); print}'
end

set EDITOR "nvim"
set VISUAL "nvim"
set TERMINAL "st"
set FILE_BROWSER "thunar"
# set BROWSER "firefox"
set BROWSER "librewolf"
set SUDO_ASKPASS "dmenupass.sh"
export EDITOR "nvim"
export VISUAL "nvim"
export TERMINAL "st"
export FILE_BROWSER "thunar"
# export BROWSER "firefox"
export BROWSER "librewolf"
export _JAVA_AWT_WM_NONREPARENTING=1
export SUDO_ASKPASS="dmenupass.sh"

set PATH $PATH /home/alex/Documents/scripts /home/alex/.emacs.d/bin /home/alex/.local/bin /home/alex/.screenlayout

switch $TERM
    case 'st-*' # suckless' simple terminal
                # Enable keypad, do it once before fish_postexec ever fires
        tput smkx
        function st_smkx --on-event fish_postexec
            tput smkx
        end
        function st_rmkx --on-event fish_preexec
            tput rmkx
        end
end

# pfetch
# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx 
    end
end
