# A collection of configuration files

*Either replace `$CONFIG_DIR` below with this directory's path or set the 
  `$CONFIG_DIR` environment variable.*

This assumes [Homebrew](https://brew.sh) is installed and working.

### zsh
* Install GNU Coreutils to enable better ls colors.
  * `brew install coreutils`
* Install [prezto](https://github.com/sorin-ionescu/prezto#installation)
  * `ln -s $HOME/.zprezto/runcoms/zshrc $HOME/.zshrc`
  * `ln -s $CONFIG_DIR/zshrc.shared ~/.zshrc.shared`
* `touch $HOME/.zshrc.local`
* Source shared and local zshrc from prezto/the system's zshrc
  ```
  echo '
  source "$HOME/.zshrc.shared"
  source "$HOME/.zshrc.local"
  ' >> $HOME/.zshrc
  ```


### vim
* Install [vim-plug](https://github.com/junegunn/vim-plug)
* `ln -s $CONFIG_DIR/vimrc ~/.config/nvim/init.vim`
* `vim +PlugInstall +qall` will install plugins
  * You can also install vim plugins by running vim and executing `:PlugInstall`
* `ln -sf $CONFIG_DIR/ruby.snippets ~/.vim/bundle/snipmate.vim/snippets/`


### gitconfig
* `ln -s $CONFIG_DIR/gitconfig ~/.gitconfig`


### tmux
* `ls -s $CONFIG_DIR/tmux.conf ~/.tmux.conf`

### font

In case I forget, I've been using [Source Code Pro](https://github.com/adobe-fonts/source-code-pro).
