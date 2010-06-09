### zsh setup
autoload -U compinit
compinit

zstyle ':completion:*' menu select

autoload -U promptinit
promptinit

local WORDCHARS=${WORDCHARS//\//}  # add slash to word characters

# share command history between shells
setopt share_history  
HISTSIZE=1000 
SAVEHIST=1000 
HISTFILE=~/.history
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY      # write after each command


PS1=$'%{\e[33;1m%}%n@%{\e[37;1m%}%m %{\e[37;1m%}%~ \$ %{\e[0m%}'
export PATH="/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/usr/local/git/bin:/usr/local/bin:/opt/local/lib/postgresql83/bin:/usr/local/apache-maven/bin:$PATH" 
export MANPATH=/opt/local/man:$MANPATH
export ALTERNATE_EDITOR=""
export EDITOR="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c"
export LS_COLORS="ex=01;31:di=01;97:ln=31:no=90:*.txt=01;32:*.erb=01;35:*.rb=35:*.mp3=01;97;44:*.org=01;90;47"

alias l="less -FRX"
alias less="less -FRX"
alias ls="ls --color"

alias ack="ack --pager='less -FRX' --ignore-dir=tmp --ignore-dir=db --ignore-dir=log --ignore-dir=target"
alias grep="ack --pager='less -FRX' --ignore-dir=tmp --ignore-dir=db --ignore-dir=log --ignore-dir=target"
alias oldgrep="/usr/bin/grep"

alias screen_ssh="screen -c ~/.screenrc_ssh"

alias emacs="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c"
alias emacs_server="/Applications/Emacs.app/Contents/MacOS/Emacs --daemon"

alias postgres="/opt/local/lib/postgresql83/bin/postgres"


### Java-related stuff
export JAVA_HOME=/Library/Java/Home
export CATALINA_HOME=/Library/Tomcat/Home
export CATALINA_LOG=/Library/Tomcat/Home/logs/catalina.out
alias tomcat_tail="tail -f $CATALINA_LOG"
#export CATALINA_OPTS="-Xmx1024m -Xms1024m -Xss1024m -Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n"
alias tomcat_start=/Library/Tomcat/Home/bin/startup.sh
alias tomcat_stop=/Library/Tomcat/Home/bin/shutdown.sh
export JPDA_TRANSPORT=dt_socket
export JPDA_ADDRESS=8880
export CLASSPATH="~/classes:$CLASSPATH"  # add classes to classpath for JAMon

### maven
export M2_HOME=/usr/local/apache-maven
export M2=$M2_home/bin
export MAVEN_OPTS="-Xmx512m -Xms512m -Xss512m"

### Subversion
alias svn="colorsvn"
alias svns="svn status"
alias diff="colordiff -ar --exclude=.svn"

# color diffs for SVN
function svnd () {
  if [ "$1" != "" ]; then
    svn diff $@ | colordiff;
  else
    svn diff | colordiff;
  fi
}

# rvm location
if [[ -s /Users/derek/.rvm/scripts/rvm ]] ; then source /Users/derek/.rvm/scripts/rvm ; fi
