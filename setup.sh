#!/bin/bash

DOT_FILES=( .gitconfig .gitignore .gitignore_global .zshrc .gemrc .tmux.conf .pryrc )

reset="\033[0m"
magenta="\033[1;35m"
cyan="\033[1;36m"

for file in ${DOT_FILES[@]}
do
  if [ -L $HOME/$file ]; then
    echo -e "${magenta}$file${reset} already exists."
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo -e "Create symlink for ${cyan}$file${reset}"
  fi
done

if [ -L $HOME/.config/nvim ]; then
  echo -e "${magenta}.config/nvim${reset} already exists."
else
  ln -s $PWD/config/nvim $HOME/.config/nvim
  echo -e "Create symlink for ${cyan}.config/nvim${reset}"
fi

if [ -L $HOME/.config/alacritty ]; then
  echo -e "${magenta}.config/alacritty${reset} already exists."
else
  ln -s $PWD/config/alacritty $HOME/.config/alacritty
  echo -e "Create symlink for ${cyan}.config/alacritty${reset}"
fi
