# Create a list of most used commands.
# alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
function most-bash() {
    history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# Add an alias and immediately reload the bash aliases file.
function aa() {
    DOTFILES_SOURCE="${BASH_SOURCE[0]}"
    # resolve $DOTFILES_SOURCE until the file is no longer a symlink
    while [ -h "$DOTFILES_SOURCE" ]; do
        DOTFILES_DIR="$( cd -P "$( dirname "$DOTFILES_SOURCE" )" && pwd )"
        DOTFILES_SOURCE="$(readlink "$DOTFILES_SOURCE")"
        # if $DOTFILES_SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
        [[ $DOTFILES_SOURCE != /* ]] && DOTFILES_SOURCE="$DOTFILES_DIR/$DOTFILES_SOURCE"
    done
    DOTFILES_DIR="$( cd -P "$( dirname "$DOTFILES_SOURCE" )" && pwd )"
    $EDITOR $DOTFILES_DIR/alias.sh
    source $DOTFILES_DIR/alias.sh
}

# Make a dir and cd into it.
function mkcd() {
    mkdir -p $1
    cd $1
}

# A better defaults to tree.
function tree2() {
    tree -CN --du --si $1
}

# Paginated colored tree.
function treeless() {
    tree -C $* | less -R
}

# Empty the local trash.
function empty-trash() {
    rm -r ~/.Trash/*
}

# Zip a whole dir into a file.
function zipr() {
    zip -r $1.zip $1
}

# Extract most know archives with one command.
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

# Download a website (no going up the directory tree and no external resources).
function getsite () {
    wget \
    -e robots=off \
    --page-requisites \
    --no-parent \
    --recursive \
    --convert-links \
    --restrict-file-names=windows \
    --adjust-extension \
    "$@"
    # --span-hosts \
    # --domain-list=labs.oreilly.com,cloudfront.net,mathjax.org,amazonaws.com \
    # --wait=5 --limit-rate=300K \
    # --no-clobber \
    # --user-agent="" \
    # --domains website.org \
}

# Download a single page including external resources.
function getwholepage () {
    wget -E -H -k -K -p "$@"
}

# Quickly get image dimensions from the command line.
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

# Encode a given image file as base64 and output css background property to clipboard.
function 64enc() {
    openssl base64 -in $1 | awk -v ext="${1#*.}" '{ str1=str1 $0 }END{ print "background:url(data:image/"ext";base64,"str1");" }' | pbcopy
    echo "$1 encoded to clipboard"
}

# Select diceware words for passphrases as seen on <http://leancrew.com/all-this/2015/04/passphrases-via-shell-pipeline/>
# needs coreutils from brew.
function diceware() {
    tr -cs A-Za-z '\n' < $1  | tr A-Z a-z | sort | uniq | gshuf --random-source=/dev/random -n6
}

# Open argument in Dash
function dash() {
    open "dash://$*"
}
function dman() {
    open "dash://man:$*"
}

change_owner_of_file() {
    local filename=$1
    local user=$2
    local group=$3

    chown $user:$group $filename
}

change_owner_of_files() {
    local user=$1; shift
    local group=$1; shift
    local files=$@
    local i

    for i in $files
    do
        chown $user:$group $i
    done
}

# Find and list processes matching a case-insensitive partial-match string.
fp () {
    ps Ao pid,comm|awk '{match($0,/[^\/]+$/); print substr($0,RSTART,RLENGTH)": "$1}'|grep -i $1|grep -v grep
}

# Build a menu of processes matching (case-insensitive, partial) first parameter
# now automatically tries to use the `quit` script if process is a Mac app <http://jon.stovell.info/personal/Software.html>.
fk () {
    local cmd OPT
    IFS=$'\n'
    PS3='Kill which process? (q to cancel): '
    select OPT in $(fp $1); do
        if [[ $OPT =~ [0-9]$ ]]; then
            cmd=$(ps -p ${OPT##* } -o command|tail -n 1)
            if [[ "$cmd" =~ "Contents/MacOS" ]] && [[ -f /usr/local/bin/quit ]]; then
                echo "Quitting ${OPT%%:*}"
                cmd=$(echo "$cmd"| sed -E 's/.*\/(.*)\.app\/.*/\1/')
                /usr/local/bin/quit -n "$cmd"
            else
                echo "killing ${OPT%%:*}"
                kill ${OPT##* }
            fi
        fi
        break
    done
    unset IFS
}

# http://frantic.im/notify-on-completion
function f_notifyme {
  LAST_EXIT_CODE=$?
  CMD=$(fc -ln -1)

  DOTFILES_SOURCE="${BASH_SOURCE[0]}"
  # resolve $DOTFILES_SOURCE until the file is no longer a symlink
  while [ -h "$DOTFILES_SOURCE" ]; do
      DOTFILES_DIR="$( cd -P "$( dirname "$DOTFILES_SOURCE" )" && pwd )"
      DOTFILES_SOURCE="$(readlink "$DOTFILES_SOURCE")"
      # if $DOTFILES_SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
      [[ $DOTFILES_SOURCE != /* ]] && DOTFILES_SOURCE="$DOTFILES_DIR/$DOTFILES_SOURCE"
  done
  DOTFILES_DIR="$( cd -P "$( dirname "$DOTFILES_SOURCE" )" && pwd )"

  # No point in waiting for the command to complete
  $DOTFILES_DIR/notify-on-completion.applescript "$CMD" "$LAST_EXIT_CODE" &
}
