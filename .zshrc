# ────── General ──────
export LANG=ja_JP.UTF-8
export EDITOR=vi
export XDG_CONFIG_HOME="$HOME/.config"
bindkey -e

# ────── Autoload ──────
autoload -Uz compinit
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz colors
compinit
colors

# ────── Completion ──────
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;36' 'cd=43;36'

# ────── Options ──────
setopt auto_cd
setopt interactive_comments
setopt correct
setopt nolistbeep

# ────── History ──────
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

# history search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# ────── Aliases ──────
alias vi=nvim
alias -g G='| grep'
alias lg='lazygit'

# ────── Man ──────
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

# ────── Path ──────
# android sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"

# ────── CLI Tools ──────
# starship
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# zellij
eval "$(zellij setup --generate-auto-start zsh)"

# eza
export FPATH="${HOME}/.cargo/bin/eza/completions/zsh:$FPATH"
if [ -x "$(command -v eza)" ]; then
  alias ls='eza --icons --group-directories-first'
fi

# zoxide
eval "$(zoxide init zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--layout=reverse --height 60% --inline-info"

function fzf-select-history() {
  local tac
  if which tac > /dev/null; then
      tac="tac"
  else
      tac="tail -r"
  fi
  BUFFER=$(history -n 1 | eval $tac | fzf --no-sort --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

# ghq + fzf
function ghq-fzf() {
  local repo=$(ghq list | fzf --preview "ls $(ghq root)/{}" --query "$LBUFFER")
  if [ -n "$repo" ]; then
    BUFFER="cd $(ghq root)/$repo"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N ghq-fzf
bindkey '^]' ghq-fzf

# mise
eval "$(mise activate zsh)"
