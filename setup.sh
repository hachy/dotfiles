#!/bin/bash

DOT_FILES=( .gitconfig .gitignore .gitignore_global .gvimrc .vimrc .vim .zshrc .gemrc .tmux.conf .pryrc )

reset="\033[0m"
magenta="\033[1;35m"
cyan="\033[1;36m"

for file in ${DOT_FILES[@]}
do
  if [ -L $HOME/$file ]; then
    echo -e "既に${magenta} $file ${reset} のシンボリックリンクが存在するょ"
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo -e "${cyan} $file ${reset} のシンボリックリンクをはったょ"
  fi
done
