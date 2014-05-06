alias la="ls -lhAG"             # -F
alias lm="la -t"				# by last modified
alias md="mkdir -p"				# make a nested dir
alias speak='say -v "Daniel" '  
alias parla='say -v "Luca" '
alias topcpu="top -o cpu"		# top sorted by cpu usage
alias topmemory="top -o rsize"	# top sorted by ram usage

alias hs='history | grep --color=auto'

alias wifi="networksetup -setairportpower en1" # use wifi on or wifi off

alias networklisteners='lsof -i -P | grep LISTEN'

alias sleepscreen="osascript -e 'tell application \"System Events\" to sleep'"

alias myip="dig myip.opendns.com @resolver1.opendns.com +short"

alias speedtest='wget -O /dev/null http://speedtest.reliableservers.com/100MBtest.bin'

alias brup='brew update && echo "$(tput bold)Outdated packages: $(tput sgr0)    (brew upgrade to fix)" && brew outdated'

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

# create a list of most used commands
# alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
function most-bash() {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# add an alias and reload the bash aliases file
function aa() {
  mate -w ~/Developer/Repos/dotfiles/alias.sh
  source ~/Developer/Repos/dotfiles/profile.sh
}

# make a dir and cd into it
function mkd() {
  mkdir -p $1
  cd $1
}

# a better defaults to tree
function tree2() {
  tree -CN --du --si $1
}

# paginated colored tree
function treeless() {
  tree -C $* | less -R
}

# empty the local trash
function empty-trash() {
  rm -r ~/.Trash/*
}

# zip a whole dir into a file
function zipr() {
  zip -r $1.zip $1
}

# Visualise Git Log
alias git-log-tree='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias git-log="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Extract most know archives with one command
function extract() {
  if [ -f $1 ] ; then
    case $1 in
    *.tar.bz2)   tar xjf $1   ;;
    *.tar.gz)    tar xzf $1   ;;
    *.bz2)       bunzip2 $1   ;;
    *.rar)       unrar e $1   ;;
    *.gz)        gunzip $1    ;;
    *.tar)       tar xf $1    ;;
    *.tbz2)      tar xjf $1   ;;
    *.tgz)       tar xzf $1   ;;
    *.zip)       unzip $1     ;;
    *.Z)         uncompress $1  ;;
    *.7z)        7z x $1    ;;
    *)   echo "'$1' cannot be extracted via extract()" ;;
     esac
   else
     echo "'$1' is not a valid file"
   fi
}

# download a website (no going up the directory tree and no external resources)
function getsite () {
  wget \
  -e robots=off \
  --page-requisites \
  --no-parent \
  --recursive \
  --convert-links \
  --restrict-file-names=windows \
  --html-extension \
  "$@"
  # --span-hosts \
  # --wait=5 --limit-rate=300K \
  # --no-clobber \
  # --user-agent="" \
  # --domains website.org \
}

# download a single page including external resources
function getwholepage () {
  wget -E -H -k -K -p "$@"
}

# Quickly get image dimensions from the command line
function imgsize() {
	local width height
	if [[ -f $1 ]]; then
		height=$(sips -g pixelHeight "$1"|tail -n 1|awk '{print $2}')
		width=$(sips -g pixelWidth "$1"|tail -n 1|awk '{print $2}')
		echo "${width} x ${height}"
	else
		echo "File not found"
	fi
}

# encode a given image file as base64 and output css background property to clipboard
function 64enc() {
  openssl base64 -in $1 | awk -v ext="${1#*.}" '{ str1=str1 $0 }END{ print "background:url(data:image/"ext";base64,"str1");" }'|pbcopy
  echo "$1 encoded to clipboard"
}
