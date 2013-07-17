## source ~/.bashrc

# variables and includes

export PS1='\[\e[1m\]\w \$\[\e[0m\] '

export EDITOR="/usr/local/bin/mate -w"

export PATH="$(brew --prefix josegonzalez/php/php54)/bin:\
/Applications/Mkvtoolnix.app/Contents/MacOS:\
$HOME/.rvm/bin:\
$PATH"

source /usr/share/git-core/git-completion.bash
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# aliases

alias la="ls -lAGh"
alias hs='history | grep --color=auto'
alias fix-openwith='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user; killall Finder; echo "Open With has been rebuilt, Finder will relaunch"'

# youtube download
alias yt="youtube-dl -o '%(title)s (%(uploader)s) [%(id)s].%(ext)s' $1"
alias ytl="youtube-dl -o '%(uploader)s - %(playlist)s/%(playlist_index)s. %(title)s [%(id)s].%(ext)s' $1"

alias yt1080="yt -f 37/46"
alias  yt720="yt -f 22/45"
alias  yt480="yt -f 44/35/18"
alias  yt360="yt -f 18/43/34"

alias ytl1080="ytl -f 37/46"
alias  ytl720="ytl -f 22/45"
alias  ytl480="ytl -f 44/35/18"
alias  ytl360="ytl -f 18/43/34"

function getsite () {
    wget \
    --recursive \
    --page-requisites \
    --html-extension \
    --convert-links \
    --restrict-file-names=windows \
    --no-parent \
    "$1"
#   --no-clobber \
#   --domains website.org \
}
