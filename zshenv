export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export ZDOTDIR="${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}"
export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive
[ -d "$HOME/.colima/default" ] && export DOCKER_HOST="${DOCKER_HOST:=unix://$HOME/.colima/default/docker.sock}"
