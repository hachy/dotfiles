export LANG=ja_JP.UTF-8
export EDITOR=vi
export TERM="xterm-256color"
bindkey -v
# 補完
autoload -U compinit
compinit
# 大小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ディレクトリ名だけでcdする。
setopt auto_cd
# ディレクトリが変わったらディレクトリスタックを表示。
chpwd_functions=($chpwd_functions dirs)
# '#' 以降をコメントとして扱う
setopt interactive_comments

setopt correct
setopt nolistbeep

# git
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b|%a)'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
precmd () { vcs_info }

# prompt
autoload -U colors
colors
PROMPT='%B%F{green}%n@%m%b%f%B%F{magenta}${vcs_info_msg_0_}%b%f%F{cyan}➜%f '
RPROMPT='[%F{cyan}%~%f]'

# apt-getとかdpkgコマンドをキャッシュを使って速くする
zstyle ':completion:*' use-cache true
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# colors
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;36' 'cd=43;36'

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

# history search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

alias -g G='| grep'

# man
export MANPAGER='less -R'
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Created by newuser for 5.0.0
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias be="bundle exec"
