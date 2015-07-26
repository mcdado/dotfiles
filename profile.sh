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
export EDITOR="mate -w"
export GIT_EDITOR="mate --name 'Git Commit Message' -w -l 1"
export PS1='\[\e[1m\]\w \$\[\e[0m\] '
export PATH="/usr/local/bin:/usr/local/sbin:$PATH:/usr/local/opt/go/libexec/bin"
export GOPATH="$HOME/Developer/go"

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
source ~/Developer/Repos/dotfiles/alias.sh
source ~/Developer/Repos/dotfiles/functions.sh

