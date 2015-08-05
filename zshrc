source /usr/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle bundler
antigen bundle git
antigen bundle heroku
antigen bundle rails
antigen bundle rbenv

antigen theme amuse

antigen apply

unset RUBYOPT

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

SAVEHIST=999999999

eval "$(rbenv init -)"
eval "$(direnv hook zsh)"

function de() {
  local image_name=$(basename $PWD | sed -e 's/\-//')_web
  local container_id=$(docker ps -f name=$image_name -f status=running -l -q)
  if [ -n "$container_id" ]; then
    docker exec -it $container_id $@
  else
    echo "$image_name is not running" 1>&2
    return 1
  fi
}
