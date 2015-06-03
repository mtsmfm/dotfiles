ZSH=$HOME/.oh-my-zsh

ZSH_THEME="amuse"

plugins=(autojump bundler cap git gnu-utils heroku knife rails rake rbenv ruby thor vundle zeus)

unset RUBYOPT
eval "$(rbenv init - zsh)"

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

_Z_CMD=j
if which brew > /dev/null; then
  . `brew --prefix`/etc/profile.d/z.sh
elif [ -f /usr/share/z/z.sh ]; then
  . /usr/share/z/z.sh
else
  . /usr/lib/z.sh
fi

## 補完時にhjklで選択
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

alias vi=vim

[[ $TERM = xterm ]] && export TERM="xterm-256color"

SAVEHIST=999999999

eval "$(direnv hook zsh)"

function de() {
  local image_name=$(basename $PWD | sed -e 's/\-//')_web
  local container_id=$(docker ps -f name=$image_name -f status=running -l -q)
  if [ -n "$container_id" ]; then
    docker exec -it $(docker ps -f name=$(basename $PWD | sed -e 's/\-//')_web -f status=running -l -q) $@
  else
    echo "$image_name is not running" 1>&2
    return 1
  fi
}
