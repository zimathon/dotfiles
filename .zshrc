#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export LANG=ja_JP.UTF-8
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY

# User configuration
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
#export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/Users/sasajimay/.nodebrew/current/bin:/usr/local/mysql/bin:/usr/local/opt/ruby/bin:/usr/bin/rails"
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# eval "$(rbenv init -)"
rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
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
alias gpr="git pull-request"
alias gst="git status -sb"
alias gd="git diff"
alias gdb='git diff -b'
alias gdc='git diff --cached'
alias gco="git checkout"
alias gvd='git difftool --tool=vimdiff --no-prompt'
alias gcmsg='git commit -m'
alias glo='git log --oneline --decorate --color'
alias globurl='noglob urlglobber '
alias glog='git log --oneline --decorate --color --graph'

plugins=(git ruby gem)

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

# The next line enables shell command completion for gcloud.
# source '/Users/sasajimay/var/google-cloud-sdk/completion.zsh.inc'
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
