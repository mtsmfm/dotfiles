export ZSH=$HOME/.oh-my-zsh

plugins=(git)

source $ZSH/oh-my-zsh.sh

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

kubectlstderr=$(kubectl config current-context 2>&1 >/dev/null)
if [[ $? == 0 ]] && [[ ${#kubectlstderr} == 0 ]]; then
  PROMPT='
%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) %{$fg_bold[red]%}%* %{$fg[blue]%}$(kubectl config current-context)%{$reset_color%}
%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
else
  PROMPT='
%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) %{$fg_bold[red]%}%*
%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '
fi

ZSH_THEME_GIT_PROMPT_PREFIX=" on%{$fg[magenta]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

alias d="docker"
alias dc="docker-compose"
alias de="docker-compose exec"
alias dr="docker-compose run --rm"
alias drv='docker run --rm -it -v $PWD:/$PWD -w /$PWD'
alias drop_connection="docker-compose exec db psql -U postgres -c 'SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pid <> pg_backend_pid();'"
alias drq='docker-compose run --rm --no-deps --entrypoint "" $(basename $(pwd))'

alias w="git add -A && git commit -m 'wip'"

export PATH=~/.bin:~/.local/bin:$PATH

eval "$(/home/mtsmfm/.local/bin/mise activate zsh)"

if [ "$CODESPACES" = "true" ]; then
  export HISTFILE=/workspaces/.zsh_history
fi
