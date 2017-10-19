export LANG=ja_JP.UTF-8
export EDITOR=vi
export TERM="xterm-256color"
export XDG_CONFIG_HOME='~/.config'
bindkey -e
# 補完
autoload -Uz compinit
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
autoload -Uz add-zsh-hook
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats '(%b)%m'
zstyle ':vcs_info:*' actionformats '(%b|%a)'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:git*+set-message:*' hooks git-stash
add-zsh-hook precmd () { vcs_info }

function +vi-git-stash() {
  local -a stashes

  if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
    stashes=$(git stash list 2>/dev/null | wc -l | tr -d ' ')
    hook_com[misc]+="%F{197}[${stashes} stashed]%f"
  fi
}

# prompt
autoload -Uz colors
colors
ICON=$'➤ '
PROMPT='%B%F{147}${ICON}%b%f%B%F{209}${vcs_info_msg_0_}%b%f '
RPROMPT='[%F{98}%~%f]'

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

alias vi=nvim
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

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias be="bundle exec"

# yarn
export PATH="$PATH:`yarn global bin`"

# z
. `brew --prefix`/etc/profile.d/z.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/bin/heroku:$PATH"

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# peco
function peco-select-history() {
  local tac
  if which tac > /dev/null; then
      tac="tac"
  else
      tac="tail -r"
  fi
  BUFFER=$(history -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
