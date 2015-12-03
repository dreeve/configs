#!/bin/zsh

# Powerline does a really poor job of explaining how to configure it.
# The only thing I've found to work across machines is to copy the config_files
# directory to ~/.config

# Delete powerline directory for testing purposes
# rm -rf ~/.config/powerline/
mkdir ~/.config/powerline
powerline_path=$(python -c 'import pkgutil; print pkgutil.get_loader("powerline").filename')
cp -r ${powerline_path}/config_files/* ~/.config/powerline
ln -s ~/configs/powerline/derek.json ~/.config/powerline/themes/tmux/
rm ~/.config/powerline/config.json
ln -s ~/configs/powerline/config.json ~/.config/powerline/config.json
powerline-daemon --replace
