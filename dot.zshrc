ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gentoo"

plugins=(autojump bundler cap git gnu-utils heroku knife rails3 rake rbenv ruby thor vundle zeus)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

. /usr/share/zsh/site-contrib/powerline.zsh

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}("
PROMPT=$'%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~)%{$reset_color%} $(git_prompt_info)\n%{$fg_bold[blue]%}$%{$reset_color%} '

_Z_CMD=j
if which brew > /dev/null; then
  . `brew --prefix`/etc/profile.d/z.sh
else
  . /usr/share/z/z.sh
fi

## 補完時にhjklで選択
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

[[ $TERM = xterm ]] && export TERM="xterm-256color"

unset RUBYOPT

eval "$(rbenv init - zsh)"
