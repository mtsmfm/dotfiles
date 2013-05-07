# Created by newuser for 4.3.10
export TERM="xterm-256color"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
autoload -U compinit
compinit

unset RUBYOPT
bindkey -e

autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
  local name st color gitdir action
  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
    return
  fi
  name=`git branch 2> /dev/null | grep '^\*' | cut -b 3-`
  if [[ -z $name ]]; then
    return
  fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=%F{green}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=%F{yellow}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=%B%F{red}
  else
    color=%F{red}
  fi

  echo "$color$name$action%f%b"
}
# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

RPROMPT='[`rprompt-git-current-branch`%~]'

# alias
case `uname` in
  Linux)
  alias ls='ls --color=auto'
  ;;
  Darwin|FreeBSD)
  alias ls='ls -GvF'
  ;;
esac
alias g='git'
alias gst='git status && g stash list'
alias gl='git log --graph --all --decorate'
alias gls='git log --stat --summary'
alias gd='git diff'
alias be='bundle exec'

gsta(){
  if [ $# -eq 1 ]; then
    git add `git status -s -b | grep -v "^#" | awk '{print$1="";print}' | grep -v "^$" | awk "NR==$1"`
  else
    echo "Usage: gsta [gst number]"
  fi
}

gstd(){
  if [ $# -eq 1 ]; then
    git diff -- `git status -s -b | grep -v "^#" | awk '{print$1="";print}' | grep -v "^$" | awk "NR==$1"`
  else
    echo "Usage: gstd [gst number]"
  fi
}

## TAB で順に補完候補を切り替える
setopt auto_menu
## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# nautilusでフォルダ開く
function naop() {
if [ "$#" = "0" ]; then
  nautilus ./
else
  for d in $@
  do
    nautilus $d
  done
fi
}

#Ctrl-wを/の手前まで
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
