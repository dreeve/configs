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

alias gst="git status"
alias be="bundle exec"
export EDITOR=vim
export GIT_EDITOR=vim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

folder_to_dmg() {
  if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/folder"
    exit 1
  fi
  
  folder=$1
  folder_size=$(du -sm $folder | cut -f1)
  vol_name="$(basename $folder)"
  
  hdiutil create -fs HFS+ -encryption -volname "$vol_name" -srcfolder "$folder" "$folder.dmg"
}
