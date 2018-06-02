# A collection of configuration files

## Setup Instructions for a new machine
At some point I'll make this into a nice little configuration script. But before
that, I need to enumerate the steps it takes!

*Either replace `$CONFIG_DIR` below with this directory's path or set the 
  `$CONFIG_DIR` environment variable.*


### zsh
* Install GNU Coreutils to enable better ls colors.
  * `brew install coreutils`
* Install [prezto](https://github.com/sorin-ionescu/prezto#installation)
* `ln -s $HOME/.zprezto/runcoms/zshrc $HOME/.zshrc`
* `ln -s $CONFIG_DIR/zshrc.shared ~/.zshrc.shared`
* `touch $HOME/.zshrc.local`
* Source shared zshrc from prezto's zshrc
```
echo '
source "$HOME/.zshrc.shared"
source "$HOME/.zshrc.local"
' >> $HOME/.zshrc
```


### vim
* `ln -s $CONFIG_DIR/vimrc ~/.config/nvim/init.vim`
* `vim +PluginInstall +qall` will install plugins
  * You can also install vim plugins by running vim and executing `:PluginInstall`
* `ln -sf $CONFIG_DIR/ruby.snippets ~/.vim/bundle/snipmate.vim/snippets/`


### gitconfig
* `ln -s $CONFIG_DIR/gitconfig ~/.gitconfig`


### tmux
* `ls -s $CONFIG_DIR/tmux.conf ~/.tmux.conf`

