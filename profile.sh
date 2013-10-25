## source ~/.bashrc

# variables and includes

export PS1='\[\e[1m\]\w \$\[\e[0m\] '
export LANG=en_US.UTF-8
export EDITOR="mate -w"
export GIT_EDITOR="mate --name 'Git Commit Message' -w -l 1"
export PATH="/usr/local/bin:\
/usr/local/sbin:\
$PATH:\
/Applications/Mkvtoolnix.app/Contents/MacOS"


if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
source $(brew --prefix)/Library/Contributions/brew_bash_completion.sh

source ~/Developer/Repos/dotfiles/alias.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
