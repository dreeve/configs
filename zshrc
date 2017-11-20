#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
FZF_DEFAULT_COMMAND='ag -g ""'
alias vim=nvim

export PATH="/usr/local/opt/python/libexec/bin:/usr/local/bin:$PATH:$(go env GOPATH)/bin"
. /usr/local/etc/profile.d/z.sh

source /usr/local/opt/chruby/share/chruby/auto.sh
source /usr/local/opt/chruby/share/chruby/chruby.sh

alias gst="git status"
