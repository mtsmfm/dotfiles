if [ -e /usr/local/opt/zplug ]; then
  # brew
  export ZPLUG_HOME=/usr/local/opt/zplug
  source $ZPLUG_HOME/init.zsh
else
  # gentoo
  source ~/.zplug/init.zsh
fi

zplug "zplug/zplug"

zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"

zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/heroku", from:oh-my-zsh
zplug "plugins/rbenv", from:oh-my-zsh

zplug "themes/amuse", from:oh-my-zsh, as:theme

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

_Z_CMD=j
if which brew > /dev/null; then
  . `brew --prefix`/etc/profile.d/z.sh
elif [ -f /usr/share/z/z.sh ]; then
  . /usr/share/z/z.sh
else
  . /usr/lib/z.sh
fi

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

[[ $TERM = xterm ]] && export TERM="xterm-256color"

eval "$(direnv hook zsh)"

alias d="docker"
alias dc="docker-compose"
alias de="docker-compose exec"
alias dr="docker-compose run --rm"
alias r="docker-compose exec web bin/rails"
alias drv='docker run --rm -it -v $PWD:/$PWD -w /$PWD'
alias drop_connection="docker-compose exec db psql -U postgres -c 'SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pid <> pg_backend_pid();'"
