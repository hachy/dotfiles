#!/bin/sh

DOT_FILES=( .gitconfig .gitignore .gvimrc .vimrc .vim .zshrc .gemrc)

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    echo "既にファイルが存在するぉ: $file"
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクをはったぉ"
  fi
done

