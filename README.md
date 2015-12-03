# A collection of configuration files

## Setup Instructions for a new machine
At some point I'll make this into a nice little configuration script. But before
that, I need to enumerate the steps it takes!

* Either replace `$CONFIG_DIR` below with this directory's path or set the 
  `$CONFIG_DIR` environment variable.
* `ln -s $CONFIG_DIR/vimrc ~/.vimrc`
* Install vim plugins by running vim and executing `:PluginInstall`
* `ln -s $CONFIG_DIR/ruby.snippets ~/.vim/bundle/snipmate.vim/snippets/`

When I wrote this I already had the powerline daemon installed, but it took
forevery to figure out how powerline is configured and how to load the changes.
I only use powerline for tmux; I use airline for vim. So the configuration can
be done in one script:

* `chmod 755 $CONFIG_DIR/powerline/configure_powerline.sh`
* `$CONFIG_DIR/powerline/configure_powerline.sh`

Add the tmux config:
* `ls -s $CONFIG_DIR/tmux.conf ~/.tmux.conf`
