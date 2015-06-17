alias la="ls -lhAG"             # -F
alias lm="la -t"                # by last modified
alias md="mkdir -p"             # make a nested dir
alias speak='say -v "Daniel" '
alias parla='say -v "Luca" '
alias topcpu="top -o cpu"       # top sorted by cpu usage
alias topmemory="top -o rsize"  # top sorted by ram usage

alias hs='history | grep --color=auto'

alias wifi="networksetup -setairportpower en1" # use wifi on or wifi off

alias networklisteners='lsof -i -P | grep LISTEN'

alias sleepscreen="osascript -e 'tell application \"System Events\" to sleep'"

alias myip="curl http://ipecho.net/plain ; echo"

alias speedevnulltest='wget -O /dev/null http://speedtest.reliableservers.com/100MBtest.bin'

alias brup='brew update && echo "$(tput bold)Outdated packages: $(tput sgr0)    (brew upgrade --all to fix)" && brew outdated'

# youtube download
alias yt="youtube-dl -o '%(title)s (%(uploader)s) [%(id)s].%(ext)s' $@"
alias ytl="youtube-dl -o '%(uploader)s - %(playlist)s/%(playlist_index)s. %(title)s [%(id)s].%(ext)s' $@"

alias yt1080="yt -f 37/46"
alias  yt720="yt -f 22/45"
alias  yt480="yt -f 44/35/18"
alias  yt360="yt -f 18/43/34"

alias ytl1080="ytl -f 37/46"
alias  ytl720="ytl -f 22/45"
alias  ytl480="ytl -f 44/35/18"
alias  ytl360="ytl -f 18/43/34"

alias yt-audio="yt -f 141/140/139"

# Fix for Open With menu
alias fix-openwith='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister \
-kill -r -domain local -domain user; \
killall Finder; \
echo "Open With has been rebuilt, Finder will relaunch"'

# Visualise Git Log
# alias git-log-tree='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
# alias git-log="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Disk usage
alias sizes="du -sh * | sort -n"
alias sizesdir="du -sh */ | sort -n"
