#!/bin/zsh

DOT_FILES=( .gitconfig .gitignore .gitignore_global .gvimrc .vimrc .vim .zshrc .gemrc .tmux.conf )

white="\033[0m"
magenta="\033[1;35m"
cyan="\033[1;36m"

for file in ${DOT_FILES[@]}
do
  if [ -L $HOME/$file ]; then
    echo "既に${magenta} $file ${white} のシンボリックリンクが存在するょ"
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "${cyan} $file ${white} のシンボリックリンクをはったょ"
  fi
done
