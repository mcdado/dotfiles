##
# Environment variables
##
export LANG=en_US.UTF-8
export EDITOR="mate -w"
export GIT_EDITOR="mate --name 'Git Commit Message' -w -l 1"
export PS1='\[\e[1m\]\w \$\[\e[0m\] '
export PATH="/usr/local/bin:/usr/local/sbin:$PATH:/Applications/Mkvtoolnix.app/Contents/MacOS"

##
# Bash completion
##
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
source $(brew --prefix)/Library/Contributions/brew_bash_completion.sh

##
# Other Bash files
##
source ~/Developer/Repos/dotfiles/alias.sh

##
# PIP 
##
#
export WORKON_HOME=$HOME/.pip/virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
# how do we install or upgrade a global package? We can temporarily turn off this restriction 
function systempip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

source /usr/local/opt/autoenv/activate.sh

##
# RVM (Ruby enVironment Manager)
##
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

