export LANG=ja_JP.UTF-8
export EDITOR=vi
bindkey -v
# ディレクトリ名だけでcdする。
setopt auto_cd
# ディレクトリが変わったらディレクトリスタックを表示。
chpwd_functions=($chpwd_functions dirs)
# 補完
autoload -U compinit
compinit

# 大小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Created by newuser for 5.0.0
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias be="bundle exec"
