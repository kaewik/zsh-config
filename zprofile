# Environment variables.
export EDITOR='vim'
export VISUAL="vim"
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

# ------------- VOLTA -----------
export VOLTA_HOME=$HOME/.volta
export PATH="$VOLTA_HOME/bin:$PATH"

# ------------ HOME -------------
export PATH="$HOME/bin:$PATH"

# ------------ Truffelhog ----------
export PATH="/usr/local/opt/util-linux/bin:$PATH"
export PATH="/usr/local/opt/util-linux/sbin:$PATH"

# ----------- HOMEBREW -----------
export HOMEBREW_NO_AUTO_UPDATE=1

#------------ SSH -------------------
SSH_DIR=~/.ssh
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval `ssh-agent -s` > /dev/null

  echo "Searching for private keys in $SSH_DIR to add to the agent..."
  echo "----------------------------------------------------------"

  # Find all files in the SSH directory that are potential private keys.
  # - The `-type f` option ensures we only process files, not directories.
  # - The `-name "id_*"` option finds files matching your naming convention.
  # - The `! -name "*.pub"` option excludes the public key files.
  # - The `-print0` and `while read -r -d ''` loop is a safe way to handle
  #   filenames that might contain spaces or special characters.
  find "$SSH_DIR" -type f -name "id_*" ! -name "*.pub" -print0 | while IFS= read -r -d '' key_file; do
    # Attempt to add the key to the agent.
    # If the key is passphrase-protected, ssh-add will prompt for it.
    # We capture the output to provide clear feedback to the user.
    if ssh-add "$key_file"; then
        echo "-> Successfully added key: $(basename "$key_file")"
    else
        echo "-> Failed to add key: $(basename "$key_file")"
    fi
  done

  echo "----------------------------------------------------------"
  echo "Script finished. Verifying keys currently in the agent:"
  echo ""

  # List the keys now in the agent for verification.
  ssh-add -l

  if [ "$?" -ne 0 ]; then
      echo "Could not list keys. There might have been an issue."
  fi
fi
