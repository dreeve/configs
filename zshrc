source /sw/bin/init.sh
autoload -U compinit
compinit
zstyle ':completion:*' menu select
autoload -U promptinit
promptinit
autoload -U colors
colors

bindkey '^i' expand-or-complete-prefix

# allow approximate
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

setopt prompt_subst
local WORDCHARS=${WORDCHARS//\//}
setopt share_history 
HISTSIZE=1000 
SAVEHIST=1000 
HISTFILE=~/.history
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY      # write after each command

##################
# BEGIN FUNCTIONS
##################
function detect_rvm_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset" 
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  [ "$version" != "" ] && version="$version" 
  local full="%{$fg_bold[white]%}$version%{$fg_bold[green]%}$gemset%{$reset_color%}"
  [ "$full" != "" ] && echo "$full"
}

function detect_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"
}

function detect_git_dirty {
  git_status=$(git status 2>&1 | tail -n1)
  [[ $git_status != "fatal: Not a git repository (or any of the parent directories): .git" ]] && [[ $git_status != "nothing to commit (working directory clean)" ]] && echo "*"
}

##################
# END FUNCTIONS
##################

PROMPT="%{$fg_bold[yellow]%}%n@%{$fg_bold[white]%}%m %~ \$ %{$reset_color%}"
RPROMPT='$(detect_rvm_version) %{$fg[cyan]%}$(detect_git_branch)%{$reset_color%}'

export PATH="/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/usr/local/git/bin:/usr/local/bin:/opt/local/lib/postgresql83/bin:/usr/local/apache-maven/bin:$PATH" 
export MANPATH=/opt/local/man:$MANPATH
export ALTERNATE_EDITOR=""
export EDITOR="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c"

export LS_COLORS="no=00:fi=00;32:di=01;37:ln=01;36:ex=01;31\
:*.txt=01;33:*.TXT=01;33:*.rtf=01;33:*.RTF=01;33:*.doc=00;36:*.DOC=00;36:*.pdf=01;33:*.PDF=01;33\
:*.pl=01;36:*.PL=01;36:*.html=01;36:*.htm=01;36:*.HTM=01;36:*.HTML=01;36:*.php=01;36:*.PHP=01;36\
:*.mpg=00;34;47:*.mpeg=00;34;47:*.MPG=00;34;47:*.MPEG=00;34;47:*.mp4=00;34;47:*.MP4=00;34;47\
:*.mov=01;34;47:*.MOV=01;34;47:*.avi=00;30;47:*.AVI=00;30;47:*.wmv=01;30;47:*.WMV=01;30;47\
:*.asf=01;37;47:*.ASR=01;37;47:*.gif=00;30;42:*.GIF=00;30;42:*.jpg=00;34;42:*.JPG=00;34;42
:*.jpeg=00;34;42:*.JPEG=00;34;42:*.bmp=01;37;42:*.BMP=01;37;42:*.mp3=01;37;44:*.MP3=01;37;44\
:*.mp2=00;37;44:*.mp2=00;37;44:*.shn=01;33;44:*.SHN=01;33;44:*.ogg=01;36;44:*.OGG=01;36;44\
:*.zip=00;34;46:*.ZIP=00;34;46:*.rar=00;34;46:*.RAR=00;34;46:*.bz2=00;35;46:*.BZ2=00;35;46\
:*.tar=00;31;46:*.TAR=00;31;46:*.gz=00;30;46:*.GZ=00;30;46"

alias l="less -FRX"
alias less="less -FRX"
alias ls="ls --color"

alias ack="ack --pager='less -FRX' --ignore-dir=tmp --ignore-dir=db --ignore-dir=log --ignore-dir=target"
alias grep="ack --pager='less -FRX' --ignore-dir=tmp --ignore-dir=db --ignore-dir=log --ignore-dir=target"
alias oldgrep="/usr/bin/grep"

alias ls="ls --color"
alias svns="svn status"
#alias diff="colordiff -ar --exclude=.svn"
alias emacs="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c"
alias emacs_server="/Applications/Emacs.app/Contents/MacOS/Emacs --daemon"
export ALTERNATE_EDITOR=""
export EDITOR="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c"
alias oldgrep="/usr/bin/grep"

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
