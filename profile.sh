##
# Globals
##
# readonly PROGNAME=$(basename $0)
# readonly PROGDIR=$(readlink -m $(dirname $0))
# readonly ARGS="$@"

##
# Environment variables
##
export LANG=en_US.UTF-8
export EDITOR="nano"
# export GIT_EDITOR="mate -w -l 1 --name 'Git Commit Message'"
# export GIT_EDITOR="atom -n -w"
export GIT_EDITOR=$EDITOR
export GIT_PAGER="less"
export PS1='\[\e[1m\]\w \$\[\e[0m\] '
export PATH="/usr/local/bin:/usr/local/sbin:$PATH:/usr/local/opt/go/libexec/bin"
export GOPATH="$HOME/Developer/go"

HISTSIZE=5000
HISTFILESIZE=1000

##
# Bash completion
##
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
source $(brew --prefix)/Library/Contributions/brew_bash_completion.sh

##
# Ruby Gems
##

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

##
# Other Bash files
##
DOTFILES_SOURCE="${BASH_SOURCE[0]}"
while [ -h "$DOTFILES_SOURCE" ]; do # resolve $DOTFILES_SOURCE until the file is no longer a symlink
  DOTFILES_DIR="$( cd -P "$( dirname "$DOTFILES_SOURCE" )" && pwd )"
  DOTFILES_SOURCE="$(readlink "$DOTFILES_SOURCE")"
  [[ $DOTFILES_SOURCE != /* ]] && DOTFILES_SOURCE="$DOTFILES_DIR/$DOTFILES_SOURCE" # if $DOTFILES_SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DOTFILES_DIR="$( cd -P "$( dirname "$DOTFILES_SOURCE" )" && pwd )"

source $DOTFILES_DIR/colors.sh
source $DOTFILES_DIR/alias.sh
source $DOTFILES_DIR/functions.sh
