##
# Globals
##
# readonly PROGNAME=$(basename $0)
# readonly PROGDIR=$(readlink -m $(dirname $0))
# readonly ARGS="$@"

# Fix the problem where non-AppleTerminal shells would not find `update_terminal_cwd`
if [[ -f /etc/bashrc_Apple_Terminal ]]; then
  source /etc/bashrc_Apple_Terminal
  PROMPT_COMMAND='history -a;update_terminal_cwd'
else
  # Record each line as it gets issued
  PROMPT_COMMAND='history -a'
fi

##
# Environment variables
##
export LANG=en_US.UTF-8
export EDITOR="nano"
export PAGER="less"
export GIT_EDITOR=$EDITOR
export GIT_PAGER=$PAGER
export PS1='\[\e[1m\]\w \$\[\e[0m\] '
export GOPATH="$HOME/Developer/go"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# https://gist.github.com/dan/5c98c450c6905088050ab8ec4df716f1
# export PS1='\[\e[01;30m\]\t`if [ $? = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ "; fi`\[\e[00;37m\]\u\[\e[01;37m\]:`[[ $(git status 2> /dev/null) =~ Changes\ to\ be\ committed: ]] && echo "\[\e[33m\]" || echo "\[\e[31m\]"``[[ ! $(git status 2> /dev/null) =~ nothing\ to\ commit,\ working\ .+\ clean ]] || echo "\[\e[32m\]"`$(__git_ps1 "(%s)\[\e[00m\]")\[\e[01;34m\]\w\[\e[00m\]\$ '

# http://frantic.im/notify-on-completion
# export PS1='$(f_notifyme)'$PS1

##
# Bash defaults
# from <https://github.com/mrzool/bash-sensible>
##

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
CDPATH=".:~:~/Repos:~/Sites"

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist


# Huge history. Doesn't appear to slow things down, so why not?
HISTSIZE=50000
HISTFILESIZE=10000

# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:bg:fg:history:clear"

# Useful timestamp format
HISTTIMEFORMAT='%F %T '

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# Don't use /etc/hosts for ssh autocomplete
# from <https://techblog.willshouse.com/2013/12/09/ssh-autocompletion-disable-using-etchosts-brew/>
export COMP_KNOWN_HOSTS_WITH_HOSTFILE=""

##
# less options
# from <https://github.com/denysdovhan/dotfiles/blob/master/tilde/zshrc.zsh>
##
less_opts=(
  # Ignore case in searches that do not contain uppercase.
  --ignore-case
  # Allow ANSI colour escapes, but no other escapes.
  --RAW-CONTROL-CHARS
  # Quiet the terminal bell (but still flash). (when trying to scroll past the end of the buffer)
  --quiet
)
export LESS=${less_opts[*]}

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
# resolve $DOTFILES_SOURCE until the file is no longer a symlink
while [ -h "$DOTFILES_SOURCE" ]; do
  DOTFILES_DIR="$( cd -P "$( dirname "$DOTFILES_SOURCE" )" && pwd )"
  DOTFILES_SOURCE="$(readlink "$DOTFILES_SOURCE")"
  # if $DOTFILES_SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  [[ $DOTFILES_SOURCE != /* ]] && DOTFILES_SOURCE="$DOTFILES_DIR/$DOTFILES_SOURCE"
done
DOTFILES_DIR="$( cd -P "$( dirname "$DOTFILES_SOURCE" )" && pwd )"

source $DOTFILES_DIR/colors.sh
source $DOTFILES_DIR/alias.sh
source $DOTFILES_DIR/functions.sh
