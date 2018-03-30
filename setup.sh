#!/bin/bash

DOT_FILES=( .gitconfig .gitignore .gitignore_global .zshrc .zshrc.local .gemrc .tmux.conf .pryrc )

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

if [ -L ~/.config/nvim ]; then
  echo -e "既に${magenta} .config/nvim ${reset} のシンボリックリンクが存在するょ"
else
  ln -s ~/dotfiles/.vim ~/.config/nvim
  echo -e "${cyan} .config/nvim ${reset} のシンボリックリンクをはったょ"
fi
