#!/bin/bash

DOT_FILES=(.zshrc)
DIRS=(nvim git alacritty tmux zellij)

NC='\033[0m'
BWhite='\033[1;37m'
BGreen='\033[1;32m'

for file in ${DOT_FILES[@]}
do
  if [ -L $HOME/$file ]; then
    echo -e "${BWhite}$file${NC} already exists."
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo -e "Create symlink for ${BGreen}$file${NC}"
  fi
done

for dir in ${DIRS[@]}
do
  if [ -L $HOME/.config/$dir ]; then
    echo -e "${BWhite}.config/$dir${NC} already exists."
  else
    ln -s $PWD/config/$dir $HOME/.config/$dir
    echo -e "Create symlink for ${BGreen}.config/$dir${NC}"
  fi
done
