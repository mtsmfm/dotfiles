# Created by newuser for 4.3.10
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

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

alias ls='ls --color=auto'
alias g='git'
alias gst='git status && g stash list'
alias gl='git log --graph --decorate --pretty=format:"%ad [%cn] <c:%h t:%t p:%p> %n %Cgree
n%d%Creset %s %n" --stat -p'
alias gls='git log --stat --summary'
alias gd='git diff'
