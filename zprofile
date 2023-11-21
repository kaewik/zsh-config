# Environment variables.
export EDITOR='nvim'
export VISUAL="nvim"
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PAGER='less -R'

# Other exported environment variables here.
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:=$HOME/.config}"
export ZDOTDIR="${ZDOTDIR:=$XDG_CONFIG_HOME/zsh}"
export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive
[ -d "$HOME/.colima/default" ] && export DOCKER_HOST="${DOCKER_HOST:=unix://$HOME/.colima/default/docker.sock}"

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# ----------- FZF -----------------
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Add paths to PATH.
# ---------------- GNU ------------------
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}"

# ----------------- LOCAL BIN ------------------
export PATH="$HOME/.local/bin:$PATH"

# ----------------- SYSTEM NPM ------------------------
export PATH="/usr/local/lib/node_modules:$PATH"

# ---------------- NIX ------------------
if [[ -f '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]]; then
  source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# ------------- VOLTA -----------
export VOLTA_HOME=$HOME/.volta
export PATH="$VOLTA_HOME/bin:$PATH"

# ------------ HOME -------------
export PATH="$HOME/bin:$PATH"
