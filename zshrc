if [ ! -e ~/.zplug/init.zsh ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
source ~/.zplug/init.zsh

zplug "zplug/zplug"

zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"

zplug "plugins/git", from:oh-my-zsh

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

[[ $TERM = xterm ]] && export TERM="xterm-256color"

PROMPT='
%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) %{$fg_bold[red]%}%*%{$reset_color%}
%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '

ZSH_THEME_GIT_PROMPT_PREFIX=" on%{$fg[magenta]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

alias d="docker"
alias dc="docker-compose"
alias de="docker-compose exec"
alias dr="docker-compose run --rm"
alias r="docker-compose exec web bin/rails"
alias drv='docker run --rm -it -v $PWD:/$PWD -w /$PWD'
alias drop_connection="docker-compose exec db psql -U postgres -c 'SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pid <> pg_backend_pid();'"
