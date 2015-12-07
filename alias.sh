alias ll="ls -lhAG"
alias la="ll -F"                # for muscle memory fallback
alias lm="ll -t"                # by last modified
alias md="mkdir -p"             # make a nested dir
alias ..="cd .."
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

alias yt1080="yt -f best[height=1080]"
alias  yt720="yt -f best[height=720]"
alias  yt480="yt -f best[height=480]"
alias  yt360="yt -f best[height=360]"

alias ytl1080="ytl -f best[height=1080]"
alias  ytl720="ytl -f best[height=720]"
alias  ytl480="ytl -f best[height=480]"
alias  ytl360="ytl -f best[height=360]"

alias yt-audio="yt -f bestaudio"

# Git related
alias git-line-count="git ls-files | xargs cat | wc -l"

# Disk usage
alias sizes="du -sh * | sort -n"
alias sizesdir="du -sh */ | sort -n"
