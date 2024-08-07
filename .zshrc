#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
# [ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export LANG=ja_JP.UTF-8
# メモリに保存される履歴の件数
export HISTSIZE=100000
export HISTFILE=~/.zhistory
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY

# User configuration
export PATH="/usr/local/bin:$PATH"
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOENV_DISABLE_GOPATH=1
export GO111MODULE=on 


export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}
# The next line enables shell command completion for gcloud.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

export PATH=~/.npm-global/bin:$PATH
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

alias zshconfig="mate ~/.zshrc"
alias vf='vim +VimFilerExplorer'
alias lgp='lgtm -m | pbcopy'
alias wintounix='tr \\ /'
#open command 
alias xo='open -a /Applications/Xcode.app'
alias rdp='open -a Remote\ Desktop\ Connection'
# git,hub
# function git(){hub "$@"} # zsh
alias g=git
alias ga='git add'
alias gb='git branch'
alias gst="git status -sb"
alias gd="git diff"
alias gdb='git diff -b'
alias gdc='git diff --cached'
alias gco="git checkout"
alias gvd='git difftool --tool=vimdiff --no-prompt'
alias gcmsg='git commit -m'
alias gcv='git commit -v'
alias gmv='git commit -v'
alias glo='git log --oneline --decorate --color'
alias globurl='noglob urlglobber '
alias glog='git log --oneline --decorate --color --graph'
alias gpr='git browse-remote --pr'
alias awk='gawk'
alias gpo='git pull origin develop'
alias vi='vim'

alias nrd='npm run dev'
alias nrs='npm run serve'

plugins=(git ruby gem)
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# peco
if [ -x "`which peco`" ]; then
  alias -g P='| peco'
  alias tp='top | peco'
  alias pp='ps aux | peco'
fi
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

autoload -Uz is-at-least
if is-at-least 4.3.11
then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*' recent-dirs-max 5000
  zstyle ':chpwd:*' recent-dirs-default yes
  zstyle ':completion:*' recent-dirs-insert both
fi
function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^xr' peco-cdr
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

#tmux auto exe
if [ -z "$TMUX" ]; then
    if type tmux >/dev/null 2>&1; then
        if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
            tmux attach && echo "tmux attached session "
        else
            tmux new-session && echo "tmux created new session"
        fi
    fi
fi
autoload -Uz add-zsh-hook
#tmux pane ssh
function tmux_ssh_preexec() {
    local command=$1
    if [[ "$command" = *ssh* ]]; then
        tmux setenv TMUX_SSH_CMD_$(tmux display -p "#I") $command
    fi
}
add-zsh-hook preexec tmux_ssh_preexec
function peco-checkout-pull-request () {
    local selected_pr_id=$(gh pr list | peco | awk '{ print $1 }')
    if [ -n "$selected_pr_id" ]; then
        BUFFER="gh pr checkout ${selected_pr_id}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-checkout-pull-request
bindkey "^g^p" peco-checkout-pull-request

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
alias k=kubectl

export PATH="$PATH:$HOME/flutter/bin"
EDITOR="vim"

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

. /usr/local/opt/asdf/libexec/asdf.sh
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/zimathon/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
alias gitk='SHELL=/bin/bash nohup /Applications/GitKraken.app/Contents/MacOS/GitKraken > /dev/null&'

