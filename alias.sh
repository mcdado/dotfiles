alias ls="ls -hG"
alias ll="ls -la"
alias la="ll -F"                # for muscle memory fallback
alias lm="ll -t"                # by last modified
alias md="mkdir -p"             # make a nested dir
alias ..="cd .."
alias speak='say -v Daniel '
alias parla='say -v Alice '
alias topcpu="top -o cpu"       # top sorted by cpu usage
alias topmemory="top -o rsize"  # top sorted by ram usage
alias rot13="echo {a..z} ; echo {n..z} {a..m}"
alias hs='history | grep --color=auto'
alias sleepscreen="osascript -e 'tell application \"System Events\" to sleep'"
alias simple-web-server="python -m SimpleHTTPServer 3000"

alias service="brew services"

# Network
alias myip="curl http://ipecho.net/plain ; echo"
alias wifi="networksetup -setairportpower" # use wifi on or wifi off
alias wifi-ip="ipconfig getifaddr en0"
alias lsof-ports='lsof -nPi | grep LISTEN'
alias ping-gateway="ping $(netstat -rn -f inet | awk '$1 == "default" {print $2}' | head -1)"

# Prefer htop over top
if [[ -x `which htop` ]]; then alias top="htop"; fi

# Git related
alias g="git"
alias git-delete-merged="git branch -r --merged master | grep -v master | sed 's/origin\///' | xargs -n 1 git push --delete origin"
alias git-line-count="git ls-files | xargs cat | wc -l"
alias git-search="git rev-list --all | xargs git grep"

# Disk usage
alias sizes="du -sh * | sort -n"
alias sizesdir="du -sh */ | sort -n"

# Youtube download
alias  yt="youtube-dl -o '%(title)s (%(uploader)s) [%(id)s].%(ext)s' $@"
alias ytl="youtube-dl -o '%(uploader)s - %(playlist)s/%(playlist_index)s. %(title)s [%(id)s].%(ext)s' $@"
alias  yt-best="yt -f best"
alias ytl-best="ytl -f best"
alias yt1080="yt -f best[height=1080]"
alias  yt720="yt -f best[height=720]"
alias  yt480="yt -f best[height=480]"
alias  yt360="yt -f best[height=360]"
alias ytl1080="ytl -f best[height=1080]"
alias  ytl720="ytl -f best[height=720]"
alias  ytl480="ytl -f best[height=480]"
alias  ytl360="ytl -f best[height=360]"

alias yt-audio="yt -f bestaudio"
alias yt-sub="yt --all-subs --write-auto-sub" # grep '<c.color' subtitles.en.vtt | sed 's/<[^>]\+>//g'
