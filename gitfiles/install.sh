#!/bin/bash
# Author: Wang Hsutung
# Date: 2015/10/29
# Locale: Wuhan, Hubei
# Email: hsu[AT]whu.edu.cn

sudo apt-get install vim-addon-manager vim-youcompleteme
vam install youcompleteme
git clone https://github.com/whst/hsu-vim.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c "execute \"PluginInstall\" | qa"
sed -i "s/set timeoutlen=150/set timeoutlen=900/g" ~/.vim/bundle/fcitx-status/plugin/fcitx.vim
