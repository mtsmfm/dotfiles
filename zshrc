source ~/.zplug/init.zsh

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
export PATH=$HOME/.nodebrew/current/bin:$PATH

alias dc="docker-compose"
alias de="docker-compose exec web"
alias dr="docker-compose run web"
alias r="docker-compose exec web bin/rails"
