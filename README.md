# A collection of configuration files

## Setup Instructions for a new machine
At some point I'll make this into a nice little configuration script. But before
that, I need to enumerate the steps it takes!

*Either replace `$CONFIG_DIR` below with this directory's path or set the 
  `$CONFIG_DIR` environment variable.*


### zsh
* Install GNU Coreutils to enable better ls colors.
* `ln -s $CONFIG_DIR/zshrc ~/zshrc`


### vim
* `ln -s $CONFIG_DIR/vimrc ~/.vimrc`
* `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* `vim +PluginInstall +qall` will install plugins
  * You can also install vim plugins by running vim and executing `:PluginInstall`
* `ln -s $CONFIG_DIR/ruby.snippets ~/.vim/bundle/snipmate.vim/snippets/`


### powerline
When I wrote this I already had the powerline daemon installed, but it took
forever to figure out how powerline is configured and how to load the changes.
I only use powerline for tmux; I use airline for vim. The configuration can
be done pretty quickly:

* `chmod 755 $CONFIG_DIR/powerline/configure_powerline.sh`
* `$CONFIG_DIR/powerline/configure_powerline.sh`


### tmux
* `ls -s $CONFIG_DIR/tmux.conf ~/.tmux.conf`

### ack
* `brew install ack`
* `ln -s $CONFIG_DIR/ackrc ~/.ackrc`

### gitconfig
* `ln -s $CONFIG_DIR/gitconfig ~/.gitconfig`
